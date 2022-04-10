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
        "PLACE" => ->(request) { handle_place(request) },
        "MOVE" => ->(_request) { handle_move },
        "LEFT" => ->(_request) { handle_left },
        "RIGHT" => ->(_request) { handle_right },
        "REPORT" => ->(_request) { handle_report }
      }
    end

    def handle_place(request)
      request_params = request.params
      return unless Commands::Place.valid_params?(request_params)

      command = Commands::Place.from_params(request_params)

      simulation.place_robot(command.x_position, command.y_position, command.direction_name)
    end

    def handle_move
      simulation.move_robot
    end

    def handle_left
      simulation.turn_robot_left
    end

    def handle_right
      simulation.turn_robot_right
    end

    def handle_report
      io.print(simulation.report)
    end
  end
end
