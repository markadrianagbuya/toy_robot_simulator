require 'translation'

##
# This Movement class encapsulates the movement logic
class Movement
  DIRECTION_TO_TRANSLATION = {
    NORTH: Translation.new(0, 1),
    EAST: Translation.new(1, 0),
    SOUTH: Translation.new(0, -1),
    WEST: Translation.new(-1, 0)
  }.freeze

  def self.advance(position, direction_name)
    translation = DIRECTION_TO_TRANSLATION[direction_name]
    position.translate(translation)
  end
end