require "toy_robot_simulation/movement"
require "toy_robot_simulation/position"
require "toy_robot_simulation/direction"

module ToyRobotSimulation
  RSpec.describe Movement do
    describe ".advance" do
      it "returns the position ahead when facing east (90°)" do
        position_ahead = described_class.advance(Position.new(1, 0), 90)

        expect(position_ahead).to eq Position.new(2, 0)
      end

      it "returns the position ahead when facing north" do
        position_ahead = described_class.advance(Position.new(3, 3), 0)

        expect(position_ahead).to eq Position.new(3, 4)
      end

      it "returns the position ahead when facing south" do
        position_ahead = described_class.advance(Position.new(5, 3), 180)

        expect(position_ahead).to eq Position.new(5, 2)
      end

      it "returns the position ahead when facing west" do
        position_ahead = described_class.advance(Position.new(5, 1), 270)

        expect(position_ahead).to eq Position.new(4, 1)
      end

      it "returns the position ahead even if it will move into negative" do
        position_ahead = described_class.advance(Position.new(0, 2), 270)

        expect(position_ahead).to eq Position.new(-1, 2)
      end

      it "returns the position ahead even if it will move into a large number" do
        position_ahead = described_class.advance(Position.new(4, 100), 0)

        expect(position_ahead).to eq Position.new(4, 101)
      end
    end

    describe ".rotate_left" do
      it "returns west when the direction is north" do
        new_direction = described_class.rotate_left(Direction.from_name("NORTH"))

        expect(new_direction).to eq Direction.from_name("WEST")
      end

      it "returns south when the direction is west" do
        new_direction = described_class.rotate_left(Direction.from_name("WEST"))

        expect(new_direction).to eq Direction.from_name("SOUTH")
      end

      it "returns east when the direction is south" do
        new_direction = described_class.rotate_left(Direction.from_name("SOUTH"))

        expect(new_direction).to eq Direction.from_name("EAST")
      end

      it "returns north when the direction is east" do
        new_direction = described_class.rotate_left(Direction.from_name("EAST"))

        expect(new_direction).to eq Direction.from_name("NORTH")
      end
    end

    describe "#rotate_right" do
      it "returns north when the direction is west" do
        new_direction = described_class.rotate_right(Direction.from_name("WEST"))

        expect(new_direction).to eq Direction.from_name("NORTH")
      end

      it "returns west when the direction is south" do
        new_direction = described_class.rotate_right(Direction.from_name("SOUTH"))

        expect(new_direction).to eq Direction.from_name("WEST")
      end

      it "returns south when the direction is east" do
        new_direction = described_class.rotate_right(Direction.from_name("EAST"))

        expect(new_direction).to eq Direction.from_name("SOUTH")
      end

      it "returns east when the direction is north" do
        new_direction = described_class.rotate_right(Direction.from_name("NORTH"))

        expect(new_direction).to eq Direction.from_name("EAST")
      end
    end
  end
end
