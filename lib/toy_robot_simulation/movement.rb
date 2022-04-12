require "toy_robot_simulation/translation"

module ToyRobotSimulation
  ##
  # This Movement class encapsulates the movement logic. It knows how turning and advancing works
  #
  class Movement
    RIGHT_ANGLE_IN_DEGREES = 90

    ANGLE_TO_TRANSLATION = {
      0 => Translation.new(0, 1),
      90 => Translation.new(1, 0),
      180 => Translation.new(0, -1),
      270 => Translation.new(-1, 0)
    }.freeze

    class << self
      def advance(position, angle)
        translation = ANGLE_TO_TRANSLATION[angle]
        position.translate(translation.x_distance, translation.y_distance)
      end

      def rotate_left(direction)
        rotate(direction, -RIGHT_ANGLE_IN_DEGREES)
      end

      def rotate_right(direction)
        rotate(direction, RIGHT_ANGLE_IN_DEGREES)
      end

      private

      def rotate(direction, angle)
        new_angle = direction.angle + angle
        @direction = Direction.from_angle(new_angle)
      end
    end
  end
end
