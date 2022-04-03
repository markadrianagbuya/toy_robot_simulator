require 'console_io'
require 'application_run'
require 'command_controller'
require 'simulation'
require 'robot'
require 'board'

##
# This application class is responsible for initializing the app and contains the main run loop logic

class Application
  attr_reader :io, :application_run, :command_controller

  def initialize
    @io = ConsoleIO.new
    @application_run = ApplicationRun.new
    simulation = Simulation.new(Robot.new, Board.new(5))
    @command_controller = CommandController.new(application_run, simulation, io)
  end

  def run
    io.output("Welcome to the robot simulator!")

    while application_run.continue_running?
      io.output("Enter a command:")
      command_input = io.read_input
      command_controller.execute(command_input)
    end

    io.output("Thanks for playing!")
  end
end
