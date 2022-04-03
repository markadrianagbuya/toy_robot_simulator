##
# This CommandCoordinator class is reponsible for executing the commands.
# It is the layer in between the application and the domain that calls the domain methods on the aggregate root

class CommandCoordinator
  attr_accessor :command_classes, :application_run, :simulation, :io

  def initialize(application_run, simulation, io)
    @application_run = application_run
    @simulation = simulation
    @io = io
  end

  def execute(command_input)
    matching_command_class = command_classes.detect { |command| command.can_handle?(command_input) }

    return unless matching_command_class

    command = matching_command_class.from_input(command_input)

    perform_command_handler(command)
  end

  private

  def perform_command_handler(command)
    command_to_handler[command.class].call
  end

  def command_to_handler
    {
      Command::Place => ->(command) { on_place(command) },
      Command::Move => ->(command) { on_move(command) },
      Command::Left => ->(command) { on_left(command) },
      Command::Right => ->(command) { on_right(command) },
      Command::Report => ->(command) { on_report(command) },
      Command::Exit => ->(command) { on_exit(command) }
    }
  end

  def on_place(command)
    simulation.place(command.x, command.y, command.direction)
  end

  def on_move(_command)
    simulation.move
  end

  def on_left(_command)
    simulation.turn_left
  end

  def on_right(_command)
    simulation.turn_right
  end

  def on_report(_command)
    io.output(simulation.report)
  end

  def on_exit(_command)
    application_run.stop
  end
end
