class ToyRobotSimulator
  attr_reader :application, :command_interpreter

  def initialize
    @application = Application.new
    command_classes = [
      Command::Place,
      Command::Move,
      Command::Left,
      Command::Right,
      Command::Report,
      Command::Exit
    ]
    simulation = Simulation.new
    @command_interpreter = CommandInterpreter.new(command_classes, application, simulation)
  end

  def run
    application.output("Welcome to the robot simulator!")
    while application.continue_running?
      application.output("Enter a command:")
      command_input = application.read_input
      command_interpreter.execute(command_input)
    end

    application.output("Thanks for playing!")
  end
end

class Application
  def continue_running?
    !stopped?
  end

  def stop
    @stopped = true
  end

  def stopped?
    @stopped
  end

  def output(text)
    puts text
  end

  def read_input
    gets.chomp.strip
  end
end

module Command
  # TODO: is there any point in creating a base command?
  class BaseCommand
    def self.from_input(_input)
      new
    end
  end

  class Place < BaseCommand
    def self.can_handle?(input)
      place_format.match?(input)
    end

    def self.place_format
      /PLACE (\d),(\d),(NORTH|EAST|SOUTH|WEST)/
    end

    def self.from_input(input)
      x, y, direction = place_format.match(input).captures

      new(x.to_i, y.to_i, direction)
    end

    attr_accessor :x, :y, :direction

    def initialize(x, y, direction)
      @x = x
      @y = y
      @direction = direction
    end
  end

  class Move < BaseCommand
    def self.can_handle?(input)
      input == "MOVE"
    end
  end

  class Left < BaseCommand
    def self.can_handle?(input)
      input == "LEFT"
    end
  end

  class Right < BaseCommand
    def self.can_handle?(input)
      input == "RIGHT"
    end
  end

  class Report < BaseCommand
    def self.can_handle?(input)
      input == "REPORT"
    end
  end

  class Exit < BaseCommand
    def self.can_handle?(input)
      input == "EXIT"
    end
  end
end

class CommandInterpreter
  attr_accessor :command_classes, :application, :simulation


  def initialize(command_classes, application, simulation)
    @command_classes = command_classes
    @application = application
    @simulation = simulation
  end

  def execute(command_input)
    matching_command_class = command_classes.detect { |command| command.can_handle?(command_input) }

    return unless matching_command_class

    command = matching_command_class.from_input(command_input)

    case command
    when Command::Place
      on_place(command)
    when Command::Move
      on_move(command)
    when Command::Left
      on_left(command)
    when Command::Right
      on_right(command)
    when Command::Report
      on_report(command)
    when Command::Exit
      on_exit(command)
    end
  end

  def on_place(command)
    simulation.place(command.x, command.y, command.direction)
  end

  def on_move(_command)
    simulation.move
  end

  def on_left(_command)
    simulation.turn_left
  end

  def on_right(_command)
    simulation.turn_right
  end

  def on_report(_command)
    application.output(simulation.report)
  end

  def on_exit(_command)
    application.stop
  end
end

class Simulation
  attr_reader :robot, :board

  def initialize
    @robot = Robot.new
    @board = Board.new(5)
  end

  def report
    "#{robot.x}, #{robot.y}, #{robot.direction}"
  end

  def place(x, y, direction)
    position = Coordinate.new(x, y)

    return unless board.position_on_board?(position)

    robot.position = position
    robot.direction = direction
  end

  def move
    return unless robot.placed?

    next_position = robot.position_ahead

    return unless board.position_on_board?(next_position)

    robot.position = next_position
  end

  def turn_left
    return unless robot.placed?

    robot.turn_left
  end

  def turn_right
    return unless robot.placed?

    robot.turn_right
  end
end

Coordinate = Struct.new(:x, :y) do
  def translate(translation)
    new_x = x + translation.x
    new_y = y + translation.y
    new(new_x, new_y)
  end
end

Translation = Struct.new(:x, :y)

class Robot
  RIGHT_ANGLE_IN_DEGREES = 90
  DIRECTION_TO_TRANSLATION = {
    NORTH: Translation.new(0, 1),
    EAST: Translation.new(1, 0),
    SOUTH: Translation.new(0, -1),
    WEST: Translation.new(-1, 0)
  }.freeze

  attr_reader :angle
  attr_accessor :position

  def x
    position.x
  end

  def y
    position.y
  end

  def placed?
    !!position && !!direction
  end

  def turn_left
    self.angle = angle - RIGHT_ANGLE_IN_DEGREES
  end

  def turn_right
    self.angle = angle + RIGHT_ANGLE_IN_DEGREES
  end

  def direction=(direction_name)
    self.angle = CardinalDirection.from_name(direction_name)
  end

  def direction
    CardinalDirection.name(angle)
  end

  def position_ahead
    position.translate(translation)
  end

  private

  def position_change
    DIRECTION_TO_TRANSLATION[direction]
  end

  def angle=(angle)
    @angle = angle % 360
  end
end


class CardinalDirection
  DIRECTION_TO_ANGLE = {
    NORTH: 0,
    EAST: 90,
    SOUTH: 180,
    WEST: 270
  }.freeze

  def self.from_name(name)
    DIRECTION_TO_ANGLE[name.to_sym]
  end

  def self.name(angle)
    DIRECTION_TO_ANGLE.invert[angle]
  end
end

class Board
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def position_on_board?(position)
    [position.x, position.y].all? { |index| index.between?(min_position_index, max_position_index) }
  end

  def min_position_index
    0
  end

  def max_position_index
    size - 1
  end
end
