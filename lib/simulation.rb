##
# This class contains the state of a "simulation". It is aware of the board and the robot.
# It acts as an "AggregateRoot" object (DDD) and provides a single entry point for applications to modify the domain.
# It does not contain any logic about the application and is designed in such a way that it can be used in many types of applications
#

class Simulation
  attr_reader :robot, :board

  def initialize(robot, board)
    @robot = robot
    @board = board
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
