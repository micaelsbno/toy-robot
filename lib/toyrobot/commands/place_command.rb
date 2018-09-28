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
      case self.face
        when 'NORTH'

        when 'LEFT'
        when 'RIGHT'
        when 'SOUTH'
        else
      end
          
      self.y = self.y + 1
    end

  end

end

