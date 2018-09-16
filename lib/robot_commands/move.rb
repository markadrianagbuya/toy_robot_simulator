module RobotCommands
  class Move
    TABLE_SIZE = 5

    def self.can_handle?(user_command)
      user_command == "MOVE"
    end

    def apply(robot, _simulator)
      return unless robot.placed?
      position_ahead = robot.position_ahead
      robot.place(position_ahead, robot.orientation) if valid_position?(position_ahead)
    end

    private

    def valid_position?(position)
      [position.x, position.y].max < TABLE_SIZE && [position.x, position.y].min >= 0
    end
  end
end
