require 'position'

module RobotCommands
  class Place
    def self.can_handle?(user_command)
      place_format.match?(user_command)
    end

    def self.place_format
      /PLACE (\d),(\d),(EAST|NORTH|WEST|SOUTH)/
    end

    def apply(user_command, robot)
      x, y, orientation = self.class.place_format.match(user_command).captures

      robot.place(Position.new(x: x.to_i, y: y.to_i), orientation)
    end
  end
end
