module RobotCommands
  class TurnRight
    def self.can_handle?(user_command)
      user_command == "RIGHT"
    end

    def apply(robot, _simulator)
      return unless robot.placed?
      robot.turn_right
    end
  end
end
