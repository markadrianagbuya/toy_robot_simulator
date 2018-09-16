class Robot
  attr_accessor :position, :orientation, :direction

  DIRECTION_TO_ORIENTATION_MAPPING = {
    "EAST" => 0,
    "NORTH" => 90,
    "WEST" => 180,
    "SOUTH" => 270
  }

  def place(position, orientation)
    self.position = position
    self.orientation = orientation
    self.direction = orientation_to_direction(orientation)
  end

  def placed?
    [position, orientation].all?
  end

  def orientation
    DIRECTION_TO_ORIENTATION_MAPPING.invert[direction]
  end

  def x_position
    position.x
  end

  def y_position
    position.y
  end

  def turn_left
    set_direction(direction + 90)
  end

  def turn_right
    set_direction(direction - 90)
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

  private

  def set_direction(direction)
    self.direction = direction % 360
  end

  def orientation_to_direction(orientation)
    DIRECTION_TO_ORIENTATION_MAPPING[orientation]
  end
end
