module Commands
  class Place
    def self.can_handle?(input)
      place_format.match?(input)
    end

    def self.place_format
      /PLACE (\d),(\d),(NORTH|EAST|SOUTH|WEST)/
    end

    def self.from_input(input)
      x, y, direction = place_format.match(input).captures

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
