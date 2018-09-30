require_relative 'position'

module ToyRobot

  class Commands
    def place (table, position)
      if table.valid_placing? (position)
        self.position = Position.new(self, table, position)
      end
    end

    def move
      if is_a_valid_movement?
        case self.position.face.direction
          when 'NORTH'
            self.position.y += 1
          when 'LEFT'
            self.position.x -= 1
          when 'RIGHT'
            self.position.x += 1
          when 'SOUTH'
            self.position.y -= 1
          else
        end 
      end       
    end

    def is_a_valid_movement?
      case self.position.face.direction
        when 'NORTH'
          self.position.y < self.position.table.y - 1
        when 'SOUTH'
          self.position.y > 0
        when 'LEFT'
          self.position.x > 0
        when 'RIGHT'
          self.position.x < self.position.table.x - 1
      end
    end
  end

end

