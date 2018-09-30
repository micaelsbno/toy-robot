module ToyRobot
  # Validators
  class ErrorChecker
    def valid_movement?
      if placed?
        case position.face.direction.upcase
        when 'NORTH'
          position.y < position.table.y - 1
        when 'SOUTH'
          position.y > 0
        when 'LEFT'
          position.x > 0
        when 'RIGHT'
          position.x < position.table.x - 1
        end
      else
        'Please, place the robot first'
      end
    end

    def valid_position?(table, position)
      position[:x].is_a?(Integer) &&
      position[:y].is_a?(Integer) &&
      position[:x] <= table.x &&
      position[:x] >= 0 &&
      position[:y] <= table.y &&
      position[:y] >= 0
    end

    def valid_direction?(position)
      position[:face].is_a?(String) &&
      %w[NORTH LEFT RIGHT SOUTH].include?(position[:face].upcase)
    end

    def valid_placing?(table, position)
      valid_position?(table, position) && valid_direction?(position)
    end
  end
end
