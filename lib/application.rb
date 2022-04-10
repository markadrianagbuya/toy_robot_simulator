require "application/console_io"
require "application/command_controller"
require "application/runner"
require "toy_robot_simulation/simulation"
require "toy_robot_simulation/robot"
require "toy_robot_simulation/board"

module Application
  DEFAULT_BOARD_SIZE = 5
  
  def self.with_default_configuration
    io = ConsoleIO.new(input: $stdin, output: $stdout)
    robot = ToyRobotSimulation::Robot.new
    board = ToyRobotSimulation::Board.new(DEFAULT_BOARD_SIZE)
    simulation = ToyRobotSimulation::Simulation.new(robot, board)
    command_controller = CommandController.new(simulation, io)
    Runner.new(io, command_controller)
  end
end
