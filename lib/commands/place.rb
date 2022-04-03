module Commands
  class Place
    def self.valid_params?(params)
      params_regex.match?(params)
    end

    def self.params_regex
      /(\d),(\d),(NORTH|EAST|SOUTH|WEST)/
    end

    def self.from_params(params)
      x, y, direction = params_regex.match(params).captures

      new(x.to_i, y.to_i, direction)
    end

    attr_accessor :x, :y, :direction

    def initialize(x, y, direction)
      @x = x
      @y = y
      @direction = direction
    end
  end
end
