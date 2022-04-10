require "application/request"
require "application/commands/place"

module Application
  ##
  # This CommandCoordinator class is reponsible for executing the commands.
  # It is the layer in between the application and the domain that calls the domain methods on the aggregate root
  #
  class CommandController
    def initialize(simulation, io)
      @simulation = simulation
      @io = io
    end

    def execute(command_input)
      return unless Request.valid_input?(command_input)

      request = Request.from_input(command_input)

      command_handler = command_to_handler[request.command_name]
      return unless command_handler

      command_handler.call(request)
    end

    private

    attr_reader :simulation, :io

    def command_to_handler
      {
        "PLACE" => ->(request) { place(request) },
        "MOVE" => ->(_request) { move },
        "LEFT" => ->(_request) { left },
        "RIGHT" => ->(_request) { right },
        "REPORT" => ->(_request) { report }
      }
    end

    def place(request)
      request_params = request.params
      return unless Commands::Place.valid_params?(request_params)

      command = Commands::Place.from_params(request_params)

      simulation.place(command.x_position, command.y_position, command.direction_name)
    end

    def move
      simulation.move
    end

    def left
      simulation.turn_left
    end

    def right
      simulation.turn_right
    end

    def report
      io.print(simulation.report)
    end
  end
end
