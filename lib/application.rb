require 'console_io'
require 'command_controller'
require 'simulation'
require 'robot'
require 'board'

##
# This application class is responsible for initializing the app and contains the main run loop logic

class Application
  attr_reader :io, :command_controller

  def initialize
    @io = ConsoleIO.new
    simulation = Simulation.new(Robot.new, Board.new(5))
    @command_controller = CommandController.new(simulation, io)
  end

  def run
    io.output("Welcome to the robot simulator!")

    loop do
      print("Enter a command:")
      command_input = io.read_input

      command_controller.execute(command_input)
    end
  end
end
