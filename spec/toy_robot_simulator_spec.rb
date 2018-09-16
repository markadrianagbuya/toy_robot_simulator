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

  def stub_user_inputs(simulator, simulation_commands)
    input_lines = simulation_commands.split("\n").map{ |command| command + "\n" }
    allow(simulator).to receive(:gets).and_return(*input_lines)
  end
end
