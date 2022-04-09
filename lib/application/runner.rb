require 'application/console_io'
require 'application/command_controller'
require 'toy_robot_simulation/simulation'
require 'toy_robot_simulation/robot'
require 'toy_robot_simulation/board'

##
# This application class is responsible for initializing the app and contains the main run loop logic

module Application
  class Runner
    DEFAULT_BOARD_SIZE = 5

    # TODO move to application.rb
    def self.with_default_configuration
      io = ConsoleIO.new(input: $stdin, output: $stdout)
      robot = ToyRobotSimulation::Robot.new
      board = ToyRobotSimulation::Board.new(DEFAULT_BOARD_SIZE)
      simulation = ToyRobotSimulation::Simulation.new(robot, board)
      command_controller = CommandController.new(simulation, io)
      new(io, command_controller)
    end

    def initialize(io, command_controller)
      @io = io
      @command_controller = command_controller
    end

    def run
      io.print("Welcome to the robot simulator!")

      loop do
        io.print("Enter a command: ")
        command_input = io.read_input

        command_controller.execute(command_input)
      end
    end

    private

    attr_reader :io, :command_controller
  end
end
