module RobotCommands
  class Move
    TABLE_SIZE = 5

    def self.can_handle?(user_command)
      user_command == "MOVE"
    end

    def apply(_user_command, robot)
      return unless robot.placed?
      position_ahead = robot.position_ahead
      robot.place(position_ahead, robot.orientation) if valid_position?(position_ahead)
    end

    private

    def valid_position?(position)
      position_on_table?(position, TABLE_SIZE)
    end

    def position_on_table?(position, table_size)
      [position.x, position.y].max < table_size && [position.x, position.y].min >= 0
    end
  end
end
