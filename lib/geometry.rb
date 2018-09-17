require 'ostruct'
require 'position'

module Geometry
  CARDINAL_DIRECTION_TO_POLAR_ANGLE_MAPPING = {
    "EAST" => 0,
    "NORTH" => 90,
    "WEST" => 180,
    "SOUTH" => 270
  }

  def self.cardinal_direction_from_polar_angle(polar_angle)
    CARDINAL_DIRECTION_TO_POLAR_ANGLE_MAPPING.invert[polar_angle]
  end

  def self.polar_angle_from_cardinal_direction(cardinal_direction)
    CARDINAL_DIRECTION_TO_POLAR_ANGLE_MAPPING[cardinal_direction]
  end

  class PolarVector
    attr_accessor :polar_angle, :magnitude

    def initialize(polar_angle:, magnitude:)
      self.polar_angle = polar_angle
      self.magnitude = magnitude
    end

    def translate_position(position)
      translation_vector = to_cartesian_form
      Position.new(x: position.x + translation_vector.x, y: position.y + translation_vector.y)
    end

    private
    
    def to_cartesian_form
      y = Math.sin(polar_angle_in_radians) * magnitude
      x = Math.cos(polar_angle_in_radians) * magnitude
      OpenStruct.new(x: x.round, y: y.round)
    end

    def polar_angle_in_radians
      @polar_angle_in_radians ||= degrees_to_radians(polar_angle)
    end

    def degrees_to_radians(degrees)
      degrees * Math::PI / 180
    end
  end
end
