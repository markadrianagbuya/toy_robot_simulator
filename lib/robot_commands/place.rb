module RobotCommands
  class Place
    def self.can_handle?(user_command)
      user_command.split(" ").first == "PLACE"
    end

    def apply(user_command, robot, _simulator)
      _place_command, position_orientation = user_command.split(" ")
      x, y, orientation = position_orientation.split(",")

      robot.place(Position.new(x: x.to_i, y: y.to_i), orientation)
    end
  end
end
