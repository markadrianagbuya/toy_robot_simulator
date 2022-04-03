module Commands
  class Exit < BaseCommand
    def self.can_handle?(input)
      input == "EXIT"
    end

    def self.from_input(_input)
      new
    end
  end
end
