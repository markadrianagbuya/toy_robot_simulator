require 'toy_robot_simulation/movement'
require 'toy_robot_simulation/position'

module ToyRobotSimulation
  RSpec.describe Movement do
    describe ".advance" do
      it "returns the position ahead when facing east" do
        position_ahead = described_class.advance(Position.new(1, 0), "EAST")

        expect(position_ahead).to eq Position.new(2, 0)
      end

      it "returns the position ahead when facing north" do
        position_ahead = described_class.advance(Position.new(3, 3), "NORTH")

        expect(position_ahead).to eq Position.new(3, 4)
      end

      it "returns the position ahead when facing south" do
        position_ahead = described_class.advance(Position.new(5, 3), "SOUTH")

        expect(position_ahead).to eq Position.new(5, 2)
      end

      it "returns the position ahead when facing west" do
        position_ahead = described_class.advance(Position.new(5, 1), "WEST")

        expect(position_ahead).to eq Position.new(4, 1)
      end

      it "returns the position ahead even if it will move into negative" do
        position_ahead = described_class.advance(Position.new(0, 2), "WEST")

        expect(position_ahead).to eq Position.new(-1, 2)
      end

      it "returns the position ahead even if it will move into a large number" do
        position_ahead = described_class.advance(Position.new(4, 100), "NORTH")

        expect(position_ahead).to eq Position.new(4, 101)
      end
    end
  end
end
