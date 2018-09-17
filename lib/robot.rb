require 'geometry'

class Robot
  def initialize(step_distance: default_step_distance)
    self.step_distance = step_distance
  end

  def place(position, orientation)
    self.position = position
    self.direction = Geometry.polar_angle_from_cardinal_direction(orientation)
  end

  def placed?
    [position, orientation].all?
  end

  def orientation
    Geometry.cardinal_direction_from_polar_angle(direction)
  end

  def x_position
    position.x
  end

  def y_position
    position.y
  end

  def turn_left
    set_direction(direction + turning_angle)
  end

  def turn_right
    set_direction(direction - turning_angle)
  end

  def position_ahead
    polar_translation_vector = Geometry::PolarVector.new(polar_angle: direction, magnitude: step_distance)
    polar_translation_vector.translate_position(position)
  end

  private

  attr_accessor :step_distance, :position, :direction

  def default_step_distance
    1
  end

  def turning_angle
    90 # degrees
  end

  def set_direction(direction)
    self.direction = direction % 360
  end
end
