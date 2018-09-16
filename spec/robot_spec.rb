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

  describe "#turn_right" do
    it "faces east after turning right when facing north" do
      robot = Robot.new
      robot.place(Position.new(x: 1, y: 2), "NORTH")
      robot.turn_right
      expect(robot.orientation).to eq "EAST"
    end

    it "faces north after turning right when facing west" do
      robot = Robot.new
      robot.place(Position.new(x: 1, y: 2), "WEST")
      robot.turn_right
      expect(robot.orientation).to eq "NORTH"
    end

    it "faces west after turning right when facing south" do
      robot = Robot.new
      robot.place(Position.new(x: 1, y: 2), "SOUTH")
      robot.turn_right
      expect(robot.orientation).to eq "WEST"
    end

    it "faces south after turning right when facing east" do
      robot = Robot.new
      robot.place(Position.new(x: 1, y: 2), "EAST")
      robot.turn_right
      expect(robot.orientation).to eq "SOUTH"
    end
  end

  describe "#position_ahead" do
    it "moves down when facing south" do
      robot = Robot.new
      robot.place(Position.new(x: 1, y: 2), "SOUTH")

      position_ahead = robot.position_ahead

      expect(position_ahead.y).to eq 1
      expect(position_ahead.x).to eq 1
    end

    it "moves left when facing west" do
      robot = Robot.new
      robot.place(Position.new(x: 1, y: 2), "WEST")

      position_ahead = robot.position_ahead

      expect(position_ahead.y).to eq 2
      expect(position_ahead.x).to eq 0
    end

    it "moves up when facing north" do
      robot = Robot.new
      robot.place(Position.new(x: 1, y: 2), "NORTH")
      
      position_ahead = robot.position_ahead

      expect(position_ahead.y).to eq 3
      expect(position_ahead.x).to eq 1
    end

    it "moves right when facing east" do
      robot = Robot.new
      robot.place(Position.new(x: 1, y: 2), "EAST")

      position_ahead = robot.position_ahead

      expect(position_ahead.y).to eq 2
      expect(position_ahead.x).to eq 2
    end
  end
end
