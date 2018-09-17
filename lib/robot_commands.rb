require 'robot_commands/turn_left'
require 'robot_commands/turn_right'
require 'robot_commands/report'
require 'robot_commands/move'
require 'robot_commands/place'

module RobotCommands
  def self.all
    [TurnLeft, TurnRight, Report, Move, Place]
  end
end
