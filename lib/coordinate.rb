##
# This Position class contains references to x and y
# It can be translated with a translation to shift the position to a new x and new y
class Position < Struct.new(:x, :y)
  def translate(translation)
    new_x = x + translation.x
    new_y = y + translation.y
    self.class.new(new_x, new_y)
  end
end
