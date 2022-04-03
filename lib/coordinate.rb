##
# This Coordinate class contains references to x and y
# It can be translated with a translation to shift the coordinate to a new x and new y

class Coordinate < Struct.new(:x, :y)
  # attr_accessor :x, :y
  # def initialize(x, y)
  #   @x = x
  #   @y = y
  # end

  def translate(translation)
    new_x = x + translation.x
    new_y = y + translation.y
    self.class.new(new_x, new_y)
  end
end