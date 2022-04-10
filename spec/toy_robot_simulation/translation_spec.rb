require "toy_robot_simulation/translation"

module ToyRobotSimulation
  RSpec.describe Translation do
    describe "attributes" do
      it "has attributes x_distance and y_distance" do
        expect(described_class.new(2, 5)).to have_attributes(x_distance: 2, y_distance: 5)
      end
    end
  end
end
