require 'robot'
require 'position'
require 'robot_commands'

class ToyRobotSimulator
  def start
    robot = Robot.new
    while (user_command = gets.chomp) != "EXIT"
      
      command_class = RobotCommands::ALL.detect { |robot_command| robot_command.can_handle?(user_command) }
      if command_class
        command_class.new.apply(robot, self)
      elsif user_command.split(" ").first == "PLACE"
        _place_command, position_orientation = user_command.split(" ")
        x, y, orientation = position_orientation.split(",")

        robot.place(Position.new(x: x.to_i, y: y.to_i), orientation)
      end
    end
  end

  def print(text)
    puts(text)
  end
end
