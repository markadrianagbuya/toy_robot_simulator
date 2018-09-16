module RobotCommands
  class Report
    def self.can_handle?(user_command)
      user_command == "REPORT"
    end

    def apply(robot, simulator)
      return unless robot.placed?
      output = [robot.x_position, robot.y_position, robot.orientation]
      simulator.print("Output: #{output.join(",")}")
    end
  end
end
