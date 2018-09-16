require 'robot_commands/place'
require 'toy_robot_simulator'
require 'robot'

RSpec.describe RobotCommands::Place do
  describe ".can_handle?" do
    it "is true when the user command is 'PLACE'" do
      expect(RobotCommands::Place.can_handle?("PLACE 1,2,EAST")).to eq true
    end

    it "is false when the user command is not 'PLACE'" do
      expect(RobotCommands::Place.can_handle?("RIGHT")).to eq false
    end

    it "is false when the user command is not 'PLACE'" do
      expect(RobotCommands::Place.can_handle?("LEFT")).to eq false
    end
  end

  describe "#apply" do
    it "places the robot" do
      robot = Robot.new
      user_command = "PLACE 1,3,SOUTH"
      RobotCommands::Place.new.apply(user_command, robot, double)
      expect(robot.placed?).to eq true
      expect(robot.x_position).to eq 1
      expect(robot.y_position).to eq 3
      expect(robot.orientation).to eq "SOUTH"
    end
  end
end
