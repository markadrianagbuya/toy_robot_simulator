module Application
  ##
  # This Request class captures the expected format of the request to be a command followed by params
  #
  class Request
    # Raised when input cannot be parsed
    ParserError = Class.new(StandardError)

    INPUT_REGEX = /^([A-Z]+)(\s([^\s]*))?$/

    class << self
      def valid_input?(input)
        INPUT_REGEX.match?(input)
      end

      def from_input(input)
        raise parser_error(input) unless valid_input?(input)

        command_name, _space, params = INPUT_REGEX.match(input).captures
        new(command_name, params)
      end

      private

      def parser_error(input)
        ParserError.new("Input '#{input}' does not match request format")
      end
    end

    attr_reader :command_name, :params

    def initialize(command_name, params)
      @command_name = command_name
      @params = params
    end
  end
end
