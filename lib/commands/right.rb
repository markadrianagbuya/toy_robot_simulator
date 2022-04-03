module Commands
  class Right < BaseCommand
    def self.can_handle?(input)
      input == "RIGHT"
    end

    def self.from_input(_input)
      new
    end
  end
end
