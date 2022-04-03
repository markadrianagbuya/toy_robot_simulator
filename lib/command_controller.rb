require 'request'
require 'commands/place'

##
# This CommandCoordinator class is reponsible for executing the commands.
# It is the layer in between the application and the domain that calls the domain methods on the aggregate root

class CommandController
  attr_accessor :application_run, :simulation, :io

  def initialize(application_run, simulation, io)
    @application_run = application_run
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

  def command_to_handler
    {
      "PLACE" => ->(request) { place(request) },
      "MOVE" => ->(_request) { move },
      "LEFT" => ->(_request) { left },
      "RIGHT" => ->(_request) { right },
      "REPORT" => ->(_request) { report },
      "EXIT" => ->(_request) { exit }
    }
  end

  def place(request)
    return unless Commands::Place.valid_params?(request.params)

    command = Commands::Place.from_params(request.params)

    simulation.place(command.x, command.y, command.direction)
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
    io.output(simulation.report)
  end

  def exit
    application_run.stop
  end
end
