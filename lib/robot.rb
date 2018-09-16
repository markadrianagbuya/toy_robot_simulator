class Robot
  attr_accessor :position, :direction

  DIRECTION_TO_ORIENTATION_MAPPING = {
    "EAST" => 0,
    "NORTH" => 90,
    "WEST" => 180,
    "SOUTH" => 270
  }

  DEFAULT_STEP_DISTANCE = 1

  def place(position, orientation)
    self.position = position
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
    y_translation = Math::sin(degrees_to_radians(direction)) * DEFAULT_STEP_DISTANCE
    x_translation = Math::cos(degrees_to_radians(direction)) * DEFAULT_STEP_DISTANCE
    Position.new(x: x_position + x_translation.round, y: y_position + y_translation.round)
  end

  private

  def degrees_to_radians(degrees)
    degrees * Math::PI / 180
  end

  def set_direction(direction)
    self.direction = direction % 360
  end

  def orientation_to_direction(orientation)
    DIRECTION_TO_ORIENTATION_MAPPING[orientation]
  end
end
