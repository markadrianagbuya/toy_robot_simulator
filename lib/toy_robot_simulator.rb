require 'robot'
require 'position'
require 'robot_commands'

class ToyRobotSimulator
  TABLE_SIZE = 5

  def start
    robot = Robot.new
    while (user_command = gets.chomp) != "EXIT"
      
      command_class = RobotCommands::ALL.detect { |robot_command| robot_command.can_handle?(user_command) }
      if command_class
        command_class.new.apply(robot, self)
      else
        if robot.placed? && user_command == "MOVE"
          position_ahead = robot.position_ahead
          robot.place(position_ahead, robot.orientation) if valid_position?(position_ahead)
        end
        if user_command.split(" ").first == "PLACE"
          _place_command, position_orientation = user_command.split(" ")
          x, y, orientation = position_orientation.split(",")

          robot.place(Position.new(x: x.to_i, y: y.to_i), orientation)
        end
      end
    end
  end

  def print(text)
    puts(text)
  end
  
  private

  def valid_position?(position)
    [position.x, position.y].max < TABLE_SIZE && [position.x, position.y].min >= 0
  end
end
