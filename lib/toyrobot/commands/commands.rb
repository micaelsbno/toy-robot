require 'pry'

module ToyRobot

  class Commands
    def place (table, position)
      if table.is_a_valid_position?(position)
        @table = table
        self.x = position[:x]
        self.y = position[:y]
        self.face = position[:face]
      end
    end

    def move
      self.y = self.y + 1
    end

  end

end

