require 'robot_commands/turn_left.rb'
require 'robot_commands/turn_right.rb'
require 'robot_commands/report.rb'
require 'robot_commands/move.rb'

module RobotCommands
  ALL = [TurnLeft, TurnRight, Report, Move]
end
