##
# This Place class captures the intent of the user to place and provides the params in a convenient and purposeful manner

module Application
  module Commands
    class Place
      InvalidParams = Class.new(StandardError)

      PARAMS_REGEX = /^(\d+),(\d+),(NORTH|EAST|SOUTH|WEST)$/

      def self.valid_params?(params)
        PARAMS_REGEX.match?(params)
      end

      def self.from_params(params)
        raise InvalidParams.new("Cannot parse params: '#{params}'") unless valid_params?(params)
        x_position, y_position, direction_name = PARAMS_REGEX.match(params).captures

        new(x_position.to_i, y_position.to_i, direction_name)
      end

      attr_reader :x_position, :y_position, :direction_name

      def initialize(x_position, y_position, direction_name)
        @x_position = x_position
        @y_position = y_position
        @direction_name = direction_name
      end
    end
  end
end
