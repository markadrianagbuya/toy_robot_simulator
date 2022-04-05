require 'toy_robot_simulation/position'

module ToyRobotSimulation
  RSpec.describe Position do
    describe "attributes" do
      it "has attributes x and y" do
        expect(described_class.new(2, 5)).to have_attributes(x: 2, y: 5)
      end
    end

    describe "equality" do
      it "is equal when there is another position with the same values" do
        expect(described_class.new(0, 0)).to eq(described_class.new(0, 0))
      end

      it "is not equal when there is another position with different values" do
        expect(described_class.new(0, 0)).to_not eq(described_class.new(0, 1))
      end
    end

    describe "#translate" do
      it "returns a new position" do
        original_position = described_class.new(0, 0)

        new_position = original_position.translate(1, 2)

        expect(new_position).to_not eq(original_position)
      end

      it "translates the position" do
        position = described_class.new(0, 0)

        new_position = position.translate(1, 2)

        expect(new_position.x).to eq 1
        expect(new_position.y).to eq 2
      end

      it "translates with negative values" do
        position = described_class.new(0, 0)

        new_position = position.translate(-1, -2)

        expect(new_position.x).to eq -1
        expect(new_position.y).to eq -2
      end

      it "translates with both positive and negative values" do
        position = described_class.new(0, 0)

        new_position = position.translate(3, -2)

        expect(new_position.x).to eq 3
        expect(new_position.y).to eq -2
      end

      it "translates from non origin positions" do
        position = described_class.new(2, 1)

        new_position = position.translate(3, -2)

        expect(new_position.x).to eq 5
        expect(new_position.y).to eq -1
      end
    end
  end
end
