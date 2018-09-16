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

  def turn_left
    if orientation == "NORTH"
      self.orientation = "WEST"
    elsif orientation == "WEST"
      self.orientation = "SOUTH"
    elsif orientation == "SOUTH"
      self.orientation = "EAST"
    elsif orientation == "EAST"
      self.orientation = "NORTH"
    end
  end
end
