class Robot
  attr_accessor :position, :orientation, :direction

  def place(position, orientation)
    self.position = position
    self.orientation = orientation
    self.direction = orientation_to_direction(orientation)
  end

  def placed?
    [position, orientation].all?
  end

  def orientation
    case direction
    when 0 then "EAST"
    when 90 then "NORTH"
    when 180 then "WEST"
    when 270 then "SOUTH"
    end
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
    case orientation
    when "EAST" then 0
    when "NORTH" then 90
    when "WEST" then 180
    when "SOUTH" then 270
    end
  end
end
