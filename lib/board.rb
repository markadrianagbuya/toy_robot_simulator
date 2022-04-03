##
# This board class represents a square two dimensional board. It knows whether a position will be on the board.

class Board
  attr_reader :size

  def initialize(size)
    @size = size
  end

  def position_on_board?(position)
    [position.x, position.y].all? { |index| index.between?(min_position_index, max_position_index) }
  end

  def min_position_index
    0
  end

  def max_position_index
    size - 1
  end
end
