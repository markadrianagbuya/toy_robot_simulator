module RobotCommands
  class TurnLeft
    def self.can_handle?(user_command)
      user_command == "LEFT"
    end

    def apply(_user_command, robot, simulator)
      return unless robot.placed?
      #should this class be aware of how much to turn instead of the robot
      robot.turn_left
    end
  end
end
