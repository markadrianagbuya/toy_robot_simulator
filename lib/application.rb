##
# This application class is responsible for initializing the app and contains the main run loop logic

class Application
  attr_reader :io, :application_run, :command_coordinator

  def initialize
    @io = ConsoleIO.new
    @application_run = ApplicationRun.new
    simulation = Simulation.new(Robot.new, Board.new(5))
    @command_coordinator = CommandCoordinator.new(application_run, simulation, io)
  end

  def run
    io.output("Welcome to the robot simulator!")

    while application_run.continue_running?
      io.output("Enter a command:")
      command_input = io.read_input
      command_coordinator.execute(command_input)
    end

    io.output("Thanks for playing!")
  end
end
