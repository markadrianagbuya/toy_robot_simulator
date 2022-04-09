##
# This Direction class can map to and from direction names and angles
module ToyRobotSimulation
  class Direction
    DIRECTION_TO_ANGLE = {
      NORTH: 0,
      EAST: 90,
      SOUTH: 180,
      WEST: 270
    }.freeze

    attr_reader :name, :angle

    def initialize(name, angle)
      @name = name
      @angle = angle
    end

    def ==(other_direction)
      name == other_direction.name && angle == other_direction.angle
    end

    def self.from_angle(angle)
      normalised_angle = angle % 360
      direction_name = DIRECTION_TO_ANGLE.invert[normalised_angle]

      Direction.new(direction_name.to_s, normalised_angle)
    end

    def self.from_name(direction_name)
      angle = DIRECTION_TO_ANGLE[direction_name.to_sym]

      Direction.new(direction_name, angle)
    end
  end
end
