require 'robot'
require 'position'

class ToyRobotSimulator
  TABLE_SIZE = 5

  def start
    robot = Robot.new
    while (command = gets.chomp) != "EXIT"
      if robot.placed?
        if command == "REPORT"
          output = [robot.x_position, robot.y_position, robot.orientation]
          puts "Output: #{output.join(",")}"
        elsif command == "LEFT"
          robot.turn_left
        elsif command == "RIGHT"
          robot.turn_right
        elsif command == "MOVE"
          position_ahead = robot.position_ahead
          robot.place(position_ahead, robot.orientation) if valid_position?(position_ahead)
        end
      end
      if command.split(" ").first == "PLACE"
        _place_command, position_orientation = command.split(" ")
        x, y, orientation = position_orientation.split(",")

        robot.place(Position.new(x: x.to_i, y: y.to_i), orientation)
      end
    end
  end
  
  private

  def valid_position?(position)
    [position.x, position.y].max < TABLE_SIZE && [position.x, position.y].min >= 0
  end
end
