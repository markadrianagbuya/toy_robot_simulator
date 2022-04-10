module Application

  ##
  # This application class is responsible for initializing the app and contains the main run loop logic
  class Runner


    def initialize(io, command_controller)
      @io = io
      @command_controller = command_controller
    end

    def run
      io.print("Welcome to the robot simulator!")

      loop do
        io.print("Enter a command: ")
        command_input = io.read_input

        command_controller.execute(command_input)
      end
    end

    private

    attr_reader :io, :command_controller
  end
end
