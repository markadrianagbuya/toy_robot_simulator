require 'robot'
require 'robot_commands'

class ToyRobotSimulator
  def start
    robot = Robot.new
    while (user_command = gets.chomp) != "EXIT"
      command_class = RobotCommands::ALL.detect { |robot_command| robot_command.can_handle?(user_command) }
      command_class.new.apply(user_command, robot) if command_class
    end
  end

  def print(text)
    puts(text)
  end
end
