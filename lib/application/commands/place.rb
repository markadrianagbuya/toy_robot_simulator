##
# This Place class captures the intent of the user to place and provides the params in a convenient and purposeful manner

module Commands
  class Place
    def self.valid_params?(params)
      params_regex.match?(params)
    end

    def self.params_regex
      /(\d),(\d),(NORTH|EAST|SOUTH|WEST)/
    end

    def self.from_params(params)
      x_position, y_position, direction_name = params_regex.match(params).captures

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
