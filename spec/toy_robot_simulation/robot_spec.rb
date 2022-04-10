require "toy_robot_simulation/robot"
require "toy_robot_simulation/position"
require "toy_robot_simulation/direction"

module ToyRobotSimulation
  RSpec.describe Robot do
    describe "#place" do
      it "changes the position of the robot" do
        robot = described_class.new

        robot.place(Position.new(1, 2), Direction.from_name("SOUTH"))

        expect(robot.position).to eq Position.new(1, 2)
      end

      it "changes the direction of the robot" do
        robot = described_class.new

        robot.place(Position.new(1, 2), Direction.from_name("SOUTH"))

        expect(robot.direction).to eq Direction.from_name("SOUTH")
      end

      it "changes the position of a robot that is already placed" do
        robot = described_class.new

        robot.place(Position.new(1, 1), Direction.from_name("WEST"))
        robot.place(Position.new(3, 5), Direction.from_name("EAST"))

        expect(robot.position).to eq Position.new(3, 5)
      end

      it "changes the direction of a robot that is already placed" do
        robot = described_class.new

        robot.place(Position.new(1, 1), Direction.from_name("WEST"))
        robot.place(Position.new(3, 5), Direction.from_name("EAST"))

        expect(robot.direction).to eq Direction.from_name("EAST")
      end
    end

    describe "#placed?" do
      it "is not placed by default" do
        robot = described_class.new
        expect(robot.placed?).to be_falsey
      end

      it "is truthy when placed" do
        robot = described_class.new
        robot.place(Position.new(1, 1), Direction.from_name("NORTH"))
        expect(robot.placed?).to be_truthy
      end
    end

    describe "#x_position" do
      it "returns the x position when robot is placed" do
        robot = described_class.new

        robot.place(Position.new(1, 2), Direction.from_name("SOUTH"))

        expect(robot.x_position).to eq 1
      end

      it "returns nil when the robot is not placed" do
        robot = described_class.new

        expect(robot.x_position).to be_nil
      end
    end

    describe "#y_position" do
      it "returns the y position when robot is placed" do
        robot = described_class.new

        robot.place(Position.new(1, 2), Direction.from_name("SOUTH"))

        expect(robot.y_position).to eq 2
      end

      it "returns nil when the robot is not placed" do
        robot = described_class.new

        expect(robot.y_position).to be_nil
      end
    end

    describe "#direction_name" do
      it "returns the direction name when robot is placed" do
        robot = described_class.new

        robot.place(Position.new(1, 2), Direction.from_name("SOUTH"))

        expect(robot.direction_name).to eq "SOUTH"
      end

      it "returns nil when the robot is not placed" do
        robot = described_class.new

        expect(robot.y_position).to be_nil
      end
    end

    describe "#turn_left" do
      it "turns the robot west when it is facing north" do
        robot = described_class.new

        robot.place(Position.new(0, 0), Direction.from_name("NORTH"))
        robot.turn_left

        expect(robot.direction).to eq Direction.from_name("WEST")
      end

      it "turns the robot south when it is facing west" do
        robot = described_class.new

        robot.place(Position.new(0, 0), Direction.from_name("WEST"))
        robot.turn_left

        expect(robot.direction).to eq Direction.from_name("SOUTH")
      end

      it "turns the robot east when it is facing south" do
        robot = described_class.new

        robot.place(Position.new(0, 0), Direction.from_name("SOUTH"))
        robot.turn_left

        expect(robot.direction).to eq Direction.from_name("EAST")
      end

      it "turns the robot north when it is facing east" do
        robot = described_class.new

        robot.place(Position.new(0, 0), Direction.from_name("EAST"))
        robot.turn_left

        expect(robot.direction).to eq Direction.from_name("NORTH")
      end

      it "faces the same direction when repeated 4 times" do
        robot = described_class.new

        robot.place(Position.new(0, 0), Direction.from_name("EAST"))
        4.times { robot.turn_left }

        expect(robot.direction).to eq Direction.from_name("EAST")
      end

      it "can be repeated more than 4 times" do
        robot = described_class.new

        robot.place(Position.new(0, 0), Direction.from_name("EAST"))
        5.times { robot.turn_left }

        expect(robot.direction).to eq Direction.from_name("NORTH")
      end
    end

    describe "#turn_right" do
      it "turns the robot north when it is facing west" do
        robot = described_class.new

        robot.place(Position.new(0, 0), Direction.from_name("WEST"))
        robot.turn_right

        expect(robot.direction).to eq Direction.from_name("NORTH")
      end

      it "turns the robot west when it is facing south" do
        robot = described_class.new

        robot.place(Position.new(0, 0), Direction.from_name("SOUTH"))
        robot.turn_right

        expect(robot.direction).to eq Direction.from_name("WEST")
      end

      it "turns the robot south when it is facing east" do
        robot = described_class.new

        robot.place(Position.new(0, 0), Direction.from_name("EAST"))
        robot.turn_right

        expect(robot.direction).to eq Direction.from_name("SOUTH")
      end

      it "turns the robot east when it is facing north" do
        robot = described_class.new

        robot.place(Position.new(0, 0), Direction.from_name("NORTH"))
        robot.turn_right

        expect(robot.direction).to eq Direction.from_name("EAST")
      end

      it "faces the same direction when repeated 4 times" do
        robot = described_class.new

        robot.place(Position.new(0, 0), Direction.from_name("SOUTH"))
        4.times { robot.turn_right }

        expect(robot.direction).to eq Direction.from_name("SOUTH")
      end

      it "can be repeated more than 4 times" do
        robot = described_class.new

        robot.place(Position.new(0, 0), Direction.from_name("EAST"))
        5.times { robot.turn_right }

        expect(robot.direction).to eq Direction.from_name("SOUTH")
      end
    end

    describe "#position_ahead" do
      it "returns the position ahead when facing east" do
        robot = described_class.new

        robot.place(Position.new(0, 0), Direction.from_name("EAST"))
        position_ahead = robot.position_ahead

        expect(position_ahead).to eq Position.new(1, 0)
      end

      it "returns the position ahead when facing north" do
        robot = described_class.new

        robot.place(Position.new(2, 3), Direction.from_name("NORTH"))
        position_ahead = robot.position_ahead

        expect(position_ahead).to eq Position.new(2, 4)
      end

      it "returns the position ahead when facing south" do
        robot = described_class.new

        robot.place(Position.new(4, 3), Direction.from_name("SOUTH"))
        position_ahead = robot.position_ahead

        expect(position_ahead).to eq Position.new(4, 2)
      end

      it "returns the position ahead when facing west" do
        robot = described_class.new

        robot.place(Position.new(3, 1), Direction.from_name("WEST"))
        position_ahead = robot.position_ahead

        expect(position_ahead).to eq Position.new(2, 1)
      end

      it "returns the position ahead even if it will move into negative" do
        robot = described_class.new

        robot.place(Position.new(0, 0), Direction.from_name("WEST"))
        position_ahead = robot.position_ahead

        expect(position_ahead).to eq Position.new(-1, 0)
      end

      it "returns the position ahead even if it will move into a large number" do
        robot = described_class.new

        robot.place(Position.new(3, 100), Direction.from_name("NORTH"))
        position_ahead = robot.position_ahead

        expect(position_ahead).to eq Position.new(3, 101)
      end
    end
  end
end
