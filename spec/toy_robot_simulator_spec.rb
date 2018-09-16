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
    allow(simulator).to receive(:puts)

    simulator.start
    expect(simulator).to have_received(:puts).with("Output: 1,2,NORTH")
  end

 it "can be placed in another position" do
    simulator = ToyRobotSimulator.new
    simulation_commands = <<~INPUT
      PLACE 3,1,SOUTH
      REPORT
      EXIT
    INPUT
    stub_user_inputs(simulator, simulation_commands)
    allow(simulator).to receive(:puts)

    simulator.start
    expect(simulator).to have_received(:puts).with("Output: 3,1,SOUTH")
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
    allow(simulator).to receive(:puts)

    simulator.start
    expect(simulator).to have_received(:puts).with("Output: 3,1,EAST")
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
    allow(simulator).to receive(:puts)

    simulator.start
    expect(simulator).to have_received(:puts).with("Output: 3,1,NORTH")
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
    allow(simulator).to receive(:puts)

    simulator.start
    expect(simulator).to have_received(:puts).with("Output: 2,4,EAST")
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
    allow(simulator).to receive(:puts)

    simulator.start
    expect(simulator).to have_received(:puts).with("Output: 3,0,SOUTH")
  end

  it "can only move within the confines of a 5x5 table" do
    simulator = ToyRobotSimulator.new
    simulation_commands = <<~INPUT
      PLACE 2,1,EAST
      MOVE
      MOVE
      MOVE
      MOVE
      REPORT
      EXIT
    INPUT
    stub_user_inputs(simulator, simulation_commands)
    allow(simulator).to receive(:puts)

    simulator.start
    expect(simulator).to have_received(:puts).with("Output: 4,1,EAST")
  end

  def stub_user_inputs(simulator, simulation_commands)
    input_lines = simulation_commands.split("\n").map{ |command| command + "\n" }
    allow(simulator).to receive(:gets).and_return(*input_lines)
  end
end
