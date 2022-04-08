require 'toy_robot_simulation/direction'

module ToyRobotSimulation
  RSpec.describe Direction do
    describe '.from_name' do
      it "returns the correct name and angle for WEST" do
        direction = described_class.from_name("WEST")
        expect(direction).to have_attributes(name: "WEST", angle: 270)
      end

      it "returns the correct name and angle for NORTH" do
        direction = described_class.from_name("NORTH")
        expect(direction).to have_attributes(name: "NORTH", angle: 0)
      end

      it "returns the correct name and angle for SOUTH" do
        direction = described_class.from_name("SOUTH")
        expect(direction).to have_attributes(name: "SOUTH", angle: 180)
      end

      it "returns the correct name and angle for EAST" do
        direction = described_class.from_name("EAST")
        expect(direction).to have_attributes(name: "EAST", angle: 90)
      end
    end

    describe '.from_angle' do
      it "returns west for angle -90" do
        direction = described_class.from_angle(-90)

        expect(direction).to have_attributes(name: "WEST", angle: 270)
      end

      it "returns west for angle 270" do
        direction = described_class.from_angle(270)
        expect(direction).to have_attributes(name: "WEST", angle: 270)
      end

      it "returns north for angle 0" do
        direction = described_class.from_angle(0)
        expect(direction).to have_attributes(name: "NORTH", angle: 0)
      end

      it "returns north for angle 360" do
        direction = described_class.from_angle(360)
        expect(direction).to have_attributes(name: "NORTH", angle: 0)
      end

      it "returns south for angle 180" do
        direction = described_class.from_angle(180)
        expect(direction).to have_attributes(name: "SOUTH", angle: 180)
      end

      it "returns east for angle 90" do
        direction = described_class.from_angle(90)
        expect(direction).to have_attributes(name: "EAST", angle: 90)
      end
    end
  end
end
