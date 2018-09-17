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
      x, y, orientation = place_args_from_command(user_command)
      position = Position.new(x: x.to_i, y: y.to_i)

      robot.place(position, orientation)
    end

    private

    def place_args_from_command(command)
      self.class.place_format.match(command).captures
    end
  end
end
