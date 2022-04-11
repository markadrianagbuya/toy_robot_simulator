module Application
  module Commands
    ##
    # This Place class captures the intent of the user to place and provides the params in a convenient and purposeful manner
    #
    class Place
      # Raised when params cannot be parsed
      InvalidParams = Class.new(StandardError)

      PARAMS_REGEX = /^(\d+),(\d+),(NORTH|EAST|SOUTH|WEST)$/

      class << self
        def valid_params?(params)
          PARAMS_REGEX.match?(params)
        end

        def from_params(params)
          raise invalid_params_error(params) unless valid_params?(params)

          x_position, y_position, direction_name = PARAMS_REGEX.match(params).captures

          new(Integer(x_position), Integer(y_position), direction_name)
        end

        private

        def invalid_params_error(params)
          InvalidParams.new("Cannot parse params: '#{params}'")
        end
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
