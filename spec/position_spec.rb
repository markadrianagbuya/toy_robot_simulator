require 'position'

RSpec.describe Position do
  describe "#x" do
    it "returns the x coordinate" do
      position = Position.new(x: 1, y: 2)
      expect(position.x).to eq 1
    end

    it "returns the x coordinate" do
      position = Position.new(x: 4, y: 2)
      expect(position.x).to eq 4
    end
  end

  describe "#y" do
    it "returns the y coordinate" do
      position = Position.new(x: 1, y: 2)
      expect(position.y).to eq 2
    end

    it "returns the y coordinate" do
      position = Position.new(x: 4, y: 5)
      expect(position.y).to eq 5
    end
  end
end
