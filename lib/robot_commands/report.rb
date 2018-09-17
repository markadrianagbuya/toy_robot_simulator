module RobotCommands
  class Report
    def self.can_handle?(user_command)
      user_command == "REPORT"
    end

    def apply(_user_command, robot)
      return unless robot.placed?

      puts "Output: #{robot.x_position},#{robot.y_position},#{robot.orientation}"
    end
  end
end
