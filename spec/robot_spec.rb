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

  describe "#turn_left" do
    it "faces west after turning left when facing north" do
      robot = Robot.new
      robot.place(Position.new(x: 1, y: 2), "NORTH")
      robot.turn_left
      expect(robot.orientation).to eq "WEST"
    end

    it "faces south after turning left when facing west" do
      robot = Robot.new
      robot.place(Position.new(x: 1, y: 2), "WEST")
      robot.turn_left
      expect(robot.orientation).to eq "SOUTH"
    end

    it "faces east after turning left when facing south" do
      robot = Robot.new
      robot.place(Position.new(x: 1, y: 2), "SOUTH")
      robot.turn_left
      expect(robot.orientation).to eq "EAST"
    end

    it "faces north after turning left when facing east" do
      robot = Robot.new
      robot.place(Position.new(x: 1, y: 2), "EAST")
      robot.turn_left
      expect(robot.orientation).to eq "NORTH"
    end
  end
end
