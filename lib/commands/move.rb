module Commands
  class Move
    def self.can_handle?(input)
      input == "MOVE"
    end

    def self.from_input(_input)
      new
    end
  end
end
