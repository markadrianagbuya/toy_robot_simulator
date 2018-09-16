class ToyRobotSimulator
  def start
    position_orientation = nil
    while (command = gets.chomp) != "EXIT"
      if command == "REPORT"
        puts "Output: #{position_orientation}"
      else
        _place_command, position_orientation = command.split(" ")
      end
    end
  end
end
