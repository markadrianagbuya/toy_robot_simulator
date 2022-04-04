##
# This Direction class can map to and from direction names and angles

class Direction
  DIRECTION_TO_ANGLE = {
    NORTH: 0,
    EAST: 90,
    SOUTH: 180,
    WEST: 270
  }.freeze

  def self.from_angle(angle)
    normalised_angle = angle % 360
    direction_name = DIRECTION_TO_ANGLE.invert[normalised_angle]
    Direction.new(direction_name, normalised_angle)
  end

  def self.from_name(direction_name)
    angle = DIRECTION_TO_ANGLE[direction_name]
    Direction.new(direction_name, angle)
  end
end

Direction = Struct.new(:name, angle)
