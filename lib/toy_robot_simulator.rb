require 'robot'
require 'position'

class ToyRobotSimulator
  def start
    robot = Robot.new
    while (command = gets.chomp) != "EXIT"
      if command == "REPORT"
        output = [robot.x_position, robot.y_position, robot.orientation]
        puts "Output: #{output.join(",")}"
      else
        _place_command, position_orientation = command.split(" ")
        x, y, orientation = position_orientation.split(",")

        robot.place(Position.new(x: x, y: y), orientation)
      end
    end
  end
end
