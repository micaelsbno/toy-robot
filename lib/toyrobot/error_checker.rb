require 'pry'

module ToyRobot
  # Validators
  class ErrorChecker
    def self.valid_movement?(robot)
      if robot.placed?
        case robot.position.face.direction.upcase
        when 'NORTH'
          robot.position.y < robot.position.table.y - 1
        when 'SOUTH'
          robot.position.y > 0
        when 'LEFT'
          robot.position.x > 0
        when 'RIGHT'
          robot.position.x < robot.position.table.x - 1
        end
      else
        'Please, place the robot first'
      end
    end
    
    def self.valid_position?(table, position)
      position[:x].is_a?(Integer) &&
      position[:y].is_a?(Integer) &&
      position[:x] <= table.x &&
      position[:x] >= 0 &&
      position[:y] <= table.y &&
      position[:y] >= 0
    end

    def self.valid_direction?(position)
      position[:face].is_a?(String) &&
      %w[NORTH LEFT RIGHT SOUTH].include?(position[:face].upcase)
    end

    def self.valid_placing?(table, position)
      valid_position?(table, position) && valid_direction?(position)
    end
  end
end
