require 'toy_robot_simulation/board'
require 'toy_robot_simulation/position'

module ToyRobotSimulation
  RSpec.describe Board do
    describe "#position_on_board?" do
      it "returns true when the position is on the origin" do
        board = described_class.new(3)
        expect(board.position_on_board?(Position.new(0, 0))).to be_truthy
      end

      it "returns true when the position is on the top right corner" do
        board = described_class.new(3)
        expect(board.position_on_board?(Position.new(2, 2))).to be_truthy
      end

      it "returns false when the position just exceeds top right corner" do
        board = described_class.new(3)
        expect(board.position_on_board?(Position.new(3, 3))).to be_falsey
      end

      it "returns false when the position just preceeds the origin" do
        board = described_class.new(3)
        expect(board.position_on_board?(Position.new(-1, -1))).to be_falsey
      end

      it "returns false when the position is below the board" do
        board = described_class.new(3)
        expect(board.position_on_board?(Position.new(1, -1))).to be_falsey
      end

      it "returns false when the position is above the board" do
        board = described_class.new(3)
        expect(board.position_on_board?(Position.new(1, 3))).to be_falsey
      end

      it "returns false when the position is left of the board" do
        board = described_class.new(3)
        expect(board.position_on_board?(Position.new(-1, 2))).to be_falsey
      end

      it "returns false when the position is right of the board" do
        board = described_class.new(3)
        expect(board.position_on_board?(Position.new(3, 2))).to be_falsey
      end
    end
  end
end
