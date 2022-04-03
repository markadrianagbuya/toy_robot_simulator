module Commands
  class Left < BaseCommand
    def self.can_handle?(input)
      input == "LEFT"
    end

    def self.from_input(_input)
      new
    end
  end
end
