require 'robot_commands/turn_right'

RSpec.describe RobotCommands::TurnRight do
  describe ".can_handle?" do
    it "is true when the user command is 'RIGHT'" do
      expect(RobotCommands::TurnRight.can_handle?("RIGHT")).to eq true
    end

    it "is false when the user command is not 'RIGHT'" do
      expect(RobotCommands::TurnRight.can_handle?("LEFT")).to eq false
    end

    it "is false when the user command is not 'RIGHT'" do
      expect(RobotCommands::TurnRight.can_handle?("REPORT")).to eq false
    end
  end

  describe "#apply" do
    it "calls turn_right on the robot" do
      robot = spy(placed?: true)
      RobotCommands::TurnRight.new.apply(robot)
      expect(robot).to have_received(:turn_right)
    end

    it "does not call turn_right on the robot when it is not placed" do
      robot = spy(placed?: false)
      RobotCommands::TurnRight.new.apply(robot)
      expect(robot).to_not have_received(:turn_right)
    end
  end
end
