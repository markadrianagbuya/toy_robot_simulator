require 'direction'
require 'movement'

##
# This robot class is aware of where it is, where it is facing, how it moves and how it turns
#
# It has "angle" as a base attribute for a more generic approach to movement and can possibly be extended to face in all angles and not just cardinal directions.
class Robot
  RIGHT_ANGLE_IN_DEGREES = 90

  attr_reader :direction, :position

  def x_position
    position.x
  end

  def y_position
    position.y
  end

  def place(position, direction)
    @position = position
    @direction = direction
  end

  def placed?
    !!position && !!direction
  end

  def turn_left
    rotate(-RIGHT_ANGLE_IN_DEGREES)
  end

  def turn_right
    rotate(RIGHT_ANGLE_IN_DEGREES)
  end

  def position_ahead
    Movement.advance(position, direction.name)
  end

  def direction_name
    direction.name
  end

  private

  def rotate(angle)
    new_angle = direction.angle + angle
    @direction = Direction.from_angle(new_angle)
  end
end
