require 'position'

module RobotCommands
  class Place
    def self.can_handle?(user_command)
      /PLACE \d,\d,(EAST|NORTH|WEST|SOUTH)/.match?(user_command)
    end

    def apply(user_command, robot, _simulator)
      _place_command, position_orientation = user_command.split(" ")
      x, y, orientation = position_orientation.split(",")

      robot.place(Position.new(x: x.to_i, y: y.to_i), orientation)
    end
  end
end
