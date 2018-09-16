require 'robot_commands/move'
require 'toy_robot_simulator'
require 'robot'

RSpec.describe RobotCommands::Move do
  describe ".can_handle?" do
    it "is true when the user command is 'MOVE'" do
      expect(RobotCommands::Move.can_handle?("MOVE")).to eq true
    end

    it "is false when the user command is not 'MOVE'" do
      expect(RobotCommands::Move.can_handle?("RIGHT")).to eq false
    end

    it "is false when the user command is not 'MOVE'" do
      expect(RobotCommands::Move.can_handle?("LEFT")).to eq false
    end
  end

  describe "#apply" do
    it "prints out the robot when the robot is placed" do
      robot = Robot.new
      robot.place(Position.new(x: 1, y: 2), "NORTH")
      simulator = instance_double(ToyRobotSimulator).as_null_object
      RobotCommands::Move.new.apply("MOVE", robot, simulator)
      expect(robot.x_position).to eq 1
      expect(robot.y_position).to eq 3
    end

    it "doesn't apply when the robot is not placed" do
      robot = Robot.new
      simulator = instance_double(ToyRobotSimulator).as_null_object
      expect { RobotCommands::Move.new.apply("MOVE", robot, simulator) }.to_not raise_error
    end
  end
end
