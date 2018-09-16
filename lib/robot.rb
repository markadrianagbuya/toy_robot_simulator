class Robot
  attr_accessor :position, :orientation

  def place(position, orientation)
    self.position = position
    self.orientation = orientation
  end

  def placed?
    [position, orientation].all?
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

  def turn_right
    if orientation == "NORTH"
      self.orientation = "EAST"
    elsif orientation == "WEST"
      self.orientation = "NORTH"
    elsif orientation == "SOUTH"
      self.orientation = "WEST"
    elsif orientation == "EAST"
      self.orientation = "SOUTH"
    end
  end

  def position_ahead
    if orientation == "SOUTH"
      Position.new(x: x_position, y: y_position - 1)
    elsif orientation == "WEST"
      Position.new(x: x_position - 1, y: y_position)
    elsif orientation == "NORTH"
      Position.new(x: x_position, y: y_position + 1)
    elsif orientation == "EAST"
      Position.new(x: x_position + 1, y: y_position)
    end
  end
end
