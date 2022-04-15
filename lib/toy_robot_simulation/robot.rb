require 'toy_robot_simulation/direction'
require 'toy_robot_simulation/movement'

module ToyRobotSimulation
  ##
  # This robot class is aware of where it is, where it is facing, how it moves and how it turns
  #
  class Robot

    attr_reader :direction, :position

    def initialize(state = Unplaced.new)
      @state = state
    end

    def x_position
      position.x
    end

    def y_position
      position.y
    end

    def direction_name
      direction.name
    end

    def direction_angle
      direction.angle
    end

    def place(position, direction)
      @position = position
      @direction = direction
      @state = Placed.new
    end

    def turn_left
      @direction = state.turn_left(self)
    end

    def turn_right
      @direction = state.turn_right(self)
    end

    def position_ahead
      state.position_ahead(self)
    end

    def report
      state.report(self)
    end

    private

    attr_reader :state

    class Unplaced
      def turn_left(_robot)
      end

      def turn_right(_robot)
      end

      def position_ahead(_robot)
      end

      def report(_robot)
      end
    end

    class Placed
      def turn_left(robot)
        Movement.rotate_left(robot.direction)
      end

      def turn_right(robot)
        Movement.rotate_right(robot.direction)
      end

      def position_ahead(robot)
        Movement.advance(robot.position, robot.direction_angle)
      end

      def report(robot)
        "Output: #{robot.x_position},#{robot.y_position},#{robot.direction_name}"
      end
    end
  end
end
