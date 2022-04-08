require 'toy_robot_simulation/simulation'
require 'toy_robot_simulation/robot'
require 'toy_robot_simulation/board'

module ToyRobotSimulation
  RSpec.describe Simulation do
    describe "#report" do
      it "returns nil if robot isn't placed" do
        simulation = described_class.new(Robot.new, Board.new(5))
        expect(simulation.report).to be_nil
      end

      it "returns a report of the robot's position" do
        simulation = described_class.new(Robot.new, Board.new(5))
        simulation.place(1, 2, "NORTH")
        expect(simulation.report).to eq "Output: 1, 2, NORTH"
      end

      it "returns a report of the robot's position after moving" do
        simulation = described_class.new(Robot.new, Board.new(5))
        simulation.place(1, 2, "NORTH")
        simulation.move
        expect(simulation.report).to eq "Output: 1, 3, NORTH"
      end

      it "returns a report of the robot's position after turning" do
        simulation = described_class.new(Robot.new, Board.new(5))
        simulation.place(1, 2, "NORTH")
        simulation.turn_right
        expect(simulation.report).to eq "Output: 1, 2, EAST"
      end
    end

    describe "#place" do
      it "places the robot when the position is valid" do
        simulation = described_class.new(Robot.new, Board.new(5))
        simulation.place(4, 4, "NORTH")

        expect(simulation.report).to eq "Output: 4, 4, NORTH"
      end

      it "places the robot multiple times" do
        simulation = described_class.new(Robot.new, Board.new(5))

        simulation.place(4, 4, "NORTH")
        expect(simulation.report).to eq "Output: 4, 4, NORTH"

        simulation.place(3, 1, "WEST")
        expect(simulation.report).to eq "Output: 3, 1, WEST"
      end

      it "does not place the robot when the position is off the board" do
        simulation = described_class.new(Robot.new, Board.new(5))
        simulation.place(5, 5, "NORTH")

        expect(simulation.report).to be_nil
      end

      it "keeps the robot's position if the new placement is off the board" do
        simulation = described_class.new(Robot.new, Board.new(5))
        simulation.place(3, 4, "SOUTH")
        simulation.place(5, 5, "NORTH")

        expect(simulation.report).to eq "Output: 3, 4, SOUTH"
      end
    end

    describe "#move" do
      it "does not error when the robot is not placed" do
        simulation = described_class.new(Robot.new, Board.new(5))

        expect { simulation.move }.to_not raise_error
      end

      it "moves a placed robot ahead" do
        simulation = described_class.new(Robot.new, Board.new(5))
        simulation.place(1, 1, "NORTH")
        simulation.move

        expect(simulation.report).to eq "Output: 1, 2, NORTH"
      end

      it "does not move the robot if the position ahead is off the board" do
        simulation = described_class.new(Robot.new, Board.new(5))
        simulation.place(4, 4, "NORTH")
        simulation.move

        expect(simulation.report).to eq "Output: 4, 4, NORTH"
      end
    end

    describe "#turn_left" do
      it "does not error when the robot is not placed" do
        simulation = described_class.new(Robot.new, Board.new(5))

        expect { simulation.turn_left }.to_not raise_error
      end

      it "turns the robot" do
        simulation = described_class.new(Robot.new, Board.new(5))
        simulation.place(4, 4, "NORTH")
        simulation.turn_left

        expect(simulation.report).to eq "Output: 4, 4, WEST"
      end

      it "turns the robot multiple times" do
        simulation = described_class.new(Robot.new, Board.new(5))
        simulation.place(4, 4, "NORTH")
        simulation.turn_left
        simulation.turn_left

        expect(simulation.report).to eq "Output: 4, 4, SOUTH"
      end
    end

    describe "#turn_right" do
      it "does not error when the robot is not placed" do
        simulation = described_class.new(Robot.new, Board.new(5))

        expect { simulation.turn_right }.to_not raise_error
      end

      it "turns the robot" do
        simulation = described_class.new(Robot.new, Board.new(5))
        simulation.place(4, 4, "EAST")
        simulation.turn_right

        expect(simulation.report).to eq "Output: 4, 4, SOUTH"
      end

      it "turns the robot multiple times" do
        simulation = described_class.new(Robot.new, Board.new(5))
        simulation.place(4, 4, "EAST")
        simulation.turn_right
        simulation.turn_right

        expect(simulation.report).to eq "Output: 4, 4, WEST"
      end
    end
  end
end
