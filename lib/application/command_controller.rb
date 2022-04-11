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

      handle_command(request)
    end

    private

    attr_reader :simulation, :io

    def handle_command(request)
      case request.command_name
      when "PLACE" then handle_place(request.params)
      when "MOVE" then handle_move
      when "LEFT" then handle_left
      when "RIGHT" then handle_right
      when "REPORT" then handle_report
      end
    end

    def handle_place(request_params)
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
