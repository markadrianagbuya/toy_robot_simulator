require 'robot_commands/report'
require 'robot'
require 'position'

RSpec.describe RobotCommands::Report do
  describe ".can_handle?" do
    it "is true when the user command is 'REPORT'" do
      expect(RobotCommands::Report.can_handle?("REPORT")).to eq true
    end

    it "is false when the user command is not 'REPORT'" do
      expect(RobotCommands::Report.can_handle?("RIGHT")).to eq false
    end

    it "is false when the user command is not 'REPORT'" do
      expect(RobotCommands::Report.can_handle?("LEFT")).to eq false
    end
  end

  describe "#apply" do
    it "prints out the robot when the robot is placed" do
      robot = Robot.new
      robot.place(Position.new(x: 1, y: 2), "NORTH")

      expect do
        RobotCommands::Report.new.apply("REPORT", robot)
      end.to output("Output: 1,2,NORTH\n").to_stdout
    end

    it "doesn't apply when the robot is not placed" do
      robot = Robot.new

      expect do
        RobotCommands::Report.new.apply("REPORT", robot)
      end.to_not output.to_stdout
    end
  end
end
