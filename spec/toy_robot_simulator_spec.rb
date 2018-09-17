require 'toy_robot_simulator'

RSpec.describe ToyRobotSimulator do
  it "can accept commands for a robot to be placed" do
    simulator = ToyRobotSimulator.new
    simulation_commands = <<~INPUT
      PLACE 1,2,NORTH
      REPORT
      EXIT
    INPUT
    stub_user_inputs(simulator, simulation_commands)

    expect { simulator.start }.to output("Output: 1,2,NORTH\n").to_stdout
  end

 it "can be placed in another position" do
    simulator = ToyRobotSimulator.new
    simulation_commands = <<~INPUT
      PLACE 3,1,SOUTH
      REPORT
      EXIT
    INPUT
    stub_user_inputs(simulator, simulation_commands)

    expect { simulator.start }.to output("Output: 3,1,SOUTH\n").to_stdout
  end

 it "can accept commands for a robot to be turned left" do
    simulator = ToyRobotSimulator.new
    simulation_commands = <<~INPUT
      PLACE 3,1,SOUTH
      LEFT
      REPORT
      EXIT
    INPUT
    stub_user_inputs(simulator, simulation_commands)

    expect { simulator.start }.to output("Output: 3,1,EAST\n").to_stdout
  end

 it "can accept commands for a robot to be turned left" do
    simulator = ToyRobotSimulator.new
    simulation_commands = <<~INPUT
      PLACE 3,1,WEST
      RIGHT
      REPORT
      EXIT
    INPUT
    stub_user_inputs(simulator, simulation_commands)

    expect { simulator.start }.to output("Output: 3,1,NORTH\n").to_stdout
  end

  it "can accept multiple place commands for the robot" do
    simulator = ToyRobotSimulator.new
    simulation_commands = <<~INPUT
      PLACE 3,1,SOUTH
      PLACE 2,4,EAST
      REPORT
      EXIT
    INPUT
    stub_user_inputs(simulator, simulation_commands)

    expect { simulator.start }.to output("Output: 2,4,EAST\n").to_stdout
  end

  it "can accept commands for a robot to move forward" do
    simulator = ToyRobotSimulator.new
    simulation_commands = <<~INPUT
      PLACE 3,1,SOUTH
      MOVE
      REPORT
      EXIT
    INPUT
    stub_user_inputs(simulator, simulation_commands)

    expect { simulator.start }.to output("Output: 3,0,SOUTH\n").to_stdout
  end

  it "can only move within the confines of a 5x5 table" do
    simulator = ToyRobotSimulator.new
    simulation_commands = <<~INPUT
      PLACE 2,1,EAST
      MOVE
      MOVE
      MOVE
      REPORT
      PLACE 2,1,SOUTH
      MOVE
      MOVE
      REPORT
      EXIT
    INPUT
    stub_user_inputs(simulator, simulation_commands)

    expect { simulator.start }.to output("Output: 4,1,EAST\nOutput: 2,0,SOUTH\n").to_stdout
  end

  it "commands before a placement are ignored" do
    simulator = ToyRobotSimulator.new
    simulation_commands = <<~INPUT
      REPORT
      RIGHT
      MOVE
      LEFT
      PLACE 2,1,EAST
      REPORT
      EXIT
    INPUT
    stub_user_inputs(simulator, simulation_commands)

    expect { simulator.start }.to output("Output: 2,1,EAST\n").to_stdout
  end

  def stub_user_inputs(simulator, simulation_commands)
    input_lines = simulation_commands.split("\n").map{ |command| command + "\n" }
    allow(simulator).to receive(:gets).and_return(*input_lines)
  end
end
