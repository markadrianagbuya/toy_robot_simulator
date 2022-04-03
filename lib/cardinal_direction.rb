##
# This CardinalDirection class can map to and from direction names and angles

class CardinalDirection
  DIRECTION_TO_ANGLE = {
    NORTH: 0,
    EAST: 90,
    SOUTH: 180,
    WEST: 270
  }.freeze

  def self.from_name(name)
    DIRECTION_TO_ANGLE[name.to_sym]
  end

  def self.name(angle)
    DIRECTION_TO_ANGLE.invert[angle]
  end
end
