require "toy_robot_simulation/translation"

module ToyRobotSimulation
  ##
  # This Movement class encapsulates the movement logic
  #
  class Movement
    ANGLE_TO_TRANSLATION = {
      0 => Translation.new(0, 1),
      90 => Translation.new(1, 0),
      180 => Translation.new(0, -1),
      270 => Translation.new(-1, 0)
    }.freeze

    def self.advance(position, angle)
      translation = ANGLE_TO_TRANSLATION[angle]
      position.translate(translation.x_distance, translation.y_distance)
    end
  end
end
