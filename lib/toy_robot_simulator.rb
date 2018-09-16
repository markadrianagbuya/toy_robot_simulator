require 'robot'
require 'position'

class ToyRobotSimulator
  TABLE_SIZE = 5

  def start
    robot = Robot.new
    while (command = gets.chomp) != "EXIT"
      if command == "REPORT"
        output = [robot.x_position, robot.y_position, robot.orientation]
        puts "Output: #{output.join(",")}"

      elsif command == "LEFT"
        robot.turn_left
      elsif command == "RIGHT"
        robot.turn_right
      elsif command == "MOVE"
        position_ahead = robot.position_ahead
        if position_ahead.x < TABLE_SIZE && position_ahead.y < TABLE_SIZE && position_ahead.x >= 0 && position_ahead.y >= 0
          robot.place(position_ahead, robot.orientation)
        end
      else
        _place_command, position_orientation = command.split(" ")
        x, y, orientation = position_orientation.split(",")

        robot.place(Position.new(x: x.to_i, y: y.to_i), orientation)
      end
    end
  end

  private

  def max_table_position
    TABLE_SIZE - 1 # since the position is zero-referenced the final position is one less
  end
end
