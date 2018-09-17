require 'geometry' 

class Robot
  attr_accessor :position, :direction

  DIRECTION_TO_ORIENTATION_MAPPING = {
    "EAST" => 0,
    "NORTH" => 90,
    "WEST" => 180,
    "SOUTH" => 270
  }

  DEFAULT_STEP_DISTANCE = 1
  DEFAULT_TURNING_ANGLE = 90

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
    set_direction(direction + DEFAULT_TURNING_ANGLE)
  end

  def turn_right
    set_direction(direction - DEFAULT_TURNING_ANGLE)
  end

  def position_ahead
    polar_translation_vector = Geometry::PolarVector.new(polar_angle: direction, magnitude: DEFAULT_STEP_DISTANCE)
    polar_translation_vector.translate_position(position)
  end

  private

  def set_direction(direction)
    self.direction = direction % 360
  end

  def orientation_to_direction(orientation)
    DIRECTION_TO_ORIENTATION_MAPPING[orientation]
  end
end
