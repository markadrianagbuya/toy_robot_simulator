require 'robot_commands/turn_left'

RSpec.describe RobotCommands::TurnLeft do
  describe ".can_handle?" do
    it "is true when the user command is 'LEFT'" do
      expect(RobotCommands::TurnLeft.can_handle?("LEFT")).to eq true
    end

    it "is false when the user command is not 'LEFT'" do
      expect(RobotCommands::TurnLeft.can_handle?("RIGHT")).to eq false
    end

    it "is false when the user command is not 'LEFT'" do
      expect(RobotCommands::TurnLeft.can_handle?("REPORT")).to eq false
    end
  end

  describe "#apply" do
    it "calls turn_left on the robot" do
      robot = spy(placed: true)
      RobotCommands::TurnLeft.new.apply("LEFT", robot, double)
      expect(robot).to have_received(:turn_left)
    end

    it "does not call turn_left on the robot when it is not placed" do
      robot = spy(placed?: false)
      RobotCommands::TurnLeft.new.apply("LEFT", robot, double)
      expect(robot).to_not have_received(:turn_left)
    end
  end
end
