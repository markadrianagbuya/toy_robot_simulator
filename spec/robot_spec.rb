require 'robot'
require 'position'

RSpec.describe 'Robot' do
  it "can be placed in a position with an orientation" do
    robot = Robot.new
    robot.place(Position.new(x: 1, y: 2), "NORTH")
    expect(robot.x_position).to eq 1
    expect(robot.y_position).to eq 2
    expect(robot.orientation).to eq "NORTH"
  end
end
