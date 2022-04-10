module ToyRobotSimulation
  ##
  # This Position class contains references to x and y
  # It can be translated with a translation to shift the position to a new x and new y
  #
  class Position < Struct.new(:x, :y)
    def translate(x_distance, y_distance)
      new_x = x + x_distance
      new_y = y + y_distance
      self.class.new(new_x, new_y)
    end
  end
end
