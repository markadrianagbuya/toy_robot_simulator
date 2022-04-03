##
# This Coordinate class contains references to x and y
# It can be translated with a translation to shift the coordinate to a new x and new y

Coordinate = Struct.new(:x, :y) do
  def translate(translation)
    new_x = x + translation.x
    new_y = y + translation.y
    new(new_x, new_y)
  end
end
