require 'toy_robot_simulation/direction'
require 'toy_robot_simulation/movement'

module ToyRobotSimulation
  ##
  # This robot class is aware of where it is, where it is facing, how it moves and how it turns
  #
  class Robot
    attr_reader :direction, :position

    def self.placed(position, direction)
      Robot.new.tap do |robot|
        robot.place(position, direction)
      end
    end

    def x_position
      position&.x
    end

    def y_position
      position&.y
    end

    def direction_name
      direction.name
    end

    def place(position, direction)
      @position = position
      @direction = direction
    end

    def placed?
      !!position && !!direction
    end

    def turn_left
      @direction = Movement.rotate_left(direction)
    end

    def turn_right
      @direction = Movement.rotate_right(direction)
    end

    def position_ahead
      Movement.advance(position, direction.angle)
    end

    def report
      "Output: #{x_position},#{y_position},#{direction_name}"
    end
  end
end
