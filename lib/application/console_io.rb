module Application
  ##
  # This ConsoleIO class defines the details of how input is obtained and how text is output to the console
  #
  class ConsoleIO
    def initialize(input:, output:)
      @input = input
      @output = output
    end

    def print(text)
      output.puts(text)
    end

    def read_input
      input.gets.strip
    end

    private

    attr_reader :input, :output
  end
end
