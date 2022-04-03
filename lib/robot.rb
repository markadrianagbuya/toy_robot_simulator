##
# This robot class is aware of where it is, where it is facing, how it moves and how it turns
#
# It has "angle" as a base attribute for a more generic approach to movement and can possibly be extended to face in all angles and not just cardinal directions.

class Robot
  RIGHT_ANGLE_IN_DEGREES = 90
  DIRECTION_TO_TRANSLATION = {
    NORTH: Translation.new(0, 1),
    EAST: Translation.new(1, 0),
    SOUTH: Translation.new(0, -1),
    WEST: Translation.new(-1, 0)
  }.freeze

  attr_reader :angle
  attr_accessor :position

  def x
    position.x
  end

  def y
    position.y
  end

  def placed?
    !!position && !!direction
  end

  def turn_left
    self.angle = angle - RIGHT_ANGLE_IN_DEGREES
  end

  def turn_right
    self.angle = angle + RIGHT_ANGLE_IN_DEGREES
  end

  def direction=(direction_name)
    self.angle = CardinalDirection.from_name(direction_name)
  end

  def direction
    CardinalDirection.name(angle)
  end

  def position_ahead
    position.translate(translation)
  end

  private

  def translation
    DIRECTION_TO_TRANSLATION[direction]
  end

  def angle=(angle)
    @angle = angle % 360
  end
end
