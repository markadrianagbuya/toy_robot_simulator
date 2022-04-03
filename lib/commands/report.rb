module Commands
  class Report < BaseCommand
    def self.can_handle?(input)
      input == "REPORT"
    end

    def self.from_input(_input)
      new
    end
  end
end
