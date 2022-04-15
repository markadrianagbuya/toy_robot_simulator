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
    def initialize(robot = UnplacedRobot.new, board)
      @robot = robot || UnplacedRobot.new
      @board = board
    end

    def report
      robot.report
    end

    def place_robot(x_position, y_position, direction_name)
      position = Position.new(x_position, y_position)
      direction = Direction.from_name(direction_name)

      return unless board.position_on_board?(position)

      @robot = Robot.placed(position, direction)
    end

    def move_robot
      next_position = robot.position_ahead

      return unless next_position && board.position_on_board?(next_position)

      robot.place(next_position, robot.direction)
    end

    def turn_robot_left
      robot.turn_left
    end

    def turn_robot_right
      robot.turn_right
    end

    private

    class UnplacedRobot

      def x_position
      end

      def y_position
      end

      def direction_name
      end

      def place(position, direction)
      end

      def turn_left
      end

      def turn_right
      end

      def position_ahead
      end

      def report
        ""
      end
    end

    attr_reader :robot, :board
  end
end
