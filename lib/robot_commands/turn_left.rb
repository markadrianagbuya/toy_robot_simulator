module RobotCommands
  class TurnLeft
    def self.can_handle?(user_command)
      user_command == "LEFT"
    end

    def apply(robot)
      return unless robot.placed?
      robot.turn_left
    end
  end
end
