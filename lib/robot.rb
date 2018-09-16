class Robot
  attr_accessor :position, :orientation

  def place(position, orientation)
    self.position = position
    self.orientation = orientation
  end

  def x_position
    position.x
  end

  def y_position
    position.y
  end
end
