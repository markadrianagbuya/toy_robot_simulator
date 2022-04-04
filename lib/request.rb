##
# This Request class captures the expected format of the request to be a command followed by params

class Request
  def self.input_regex
    /([A-Z]*)\s?([^\s]*)/
  end

  def self.valid_input?(input)
    input_regex.match?(input)
  end

  def self.from_input(input)
    command_name, params = input_regex.match(input).captures
    new(command_name, params)
  end

  attr_reader :command_name, :params

  def initialize(command_name, params)
    @command_name = command_name
    @params = params
  end
end
