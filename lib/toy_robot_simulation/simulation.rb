require "toy_robot_simulation/position"
require "toy_robot_simulation/direction"

module ToyRobotSimulation
  ##
  # This class contains the state of a "simulation".
  # It is aware of the board and the robot and the rules that govern where the robot can move and be placed.
  # This allows the robot and board to be decoupled from awareness of each other and the rules.
  # Simulation acts as an "AggregateRoot" object (DDD).
  # It provides a single entry point for applications to modify the domain, ensuring that all entities within the domain are in the correct state.
  # It does not contain any logic about the application and is designed in such a way that it can be used in many types of applications
  #
  class Simulation
    def initialize(robot, board)
      @robot = robot
      @board = board
    end

    def report
      return unless robot.placed?

      "Output: #{robot.x_position},#{robot.y_position},#{robot.direction_name}"
    end

    def place_robot(x_position, y_position, direction_name)
      position = Position.new(x_position, y_position)
      direction = Direction.from_name(direction_name)

      return unless board.position_on_board?(position)

      robot.place(position, direction)
    end

    def move_robot
      return unless robot.placed?

      next_position = robot.position_ahead

      return unless board.position_on_board?(next_position)

      robot.place(next_position, robot.direction)
    end

    def turn_robot_left
      return unless robot.placed?

      robot.turn_left
    end

    def turn_robot_right
      return unless robot.placed?

      robot.turn_right
    end

    private

    attr_reader :robot, :board
  end
end
