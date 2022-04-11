module Application
  ##
  # This application class is responsible for the run loop logic
  #
  class Runner
    def initialize(io, command_controller)
      @io = io
      @command_controller = command_controller
    end

    def run
      print_welcome_message

      loop do
        command_controller.execute(read_command_input)
      end
    end

    private

    def print_welcome_message
      io.print("Welcome to the robot simulator!")
    end

    def read_command_input
      io.print("Enter a command: ")

      io.read_input
    end

    attr_reader :io, :command_controller
  end
end
