require "application/console_io"
require "application/command_controller"
require "application/runner"
require "toy_robot_simulation/simulation"
require "toy_robot_simulation/robot"
require "toy_robot_simulation/board"

##
# This Application module contains the main methods to configure the runner and application.
# It is the composition root that instantiates all the required objects and their dependencies.
#
module Application
  DEFAULT_BOARD_SIZE = 5

  def self.runner_with_default_configuration
    simulation = default_simulation
    io = ConsoleIO.new(input: $stdin, output: $stdout)
    command_controller = CommandController.new(simulation, io)

    Runner.new(io, command_controller)
  end

  def self.default_simulation
    board = ToyRobotSimulation::Board.new(DEFAULT_BOARD_SIZE)
    ToyRobotSimulation::Simulation.new(board)
  end
end
