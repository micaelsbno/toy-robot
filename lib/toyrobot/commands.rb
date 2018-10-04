require_relative 'position'
require_relative 'error_checker'

module ToyRobot
  # Defines robot's commands
  class Commands

    def place(table, position)
      raise ArgumentError, 'Invalid command' unless ErrorChecker.valid_placing?(table, position)
      self.position = Position.new(table, position)
    end

    def rotate_left
      position.face.rotate_left
    end

    def rotate_right
      position.face.rotate_right
    end

    def move
      return 'Please, place the robot first' unless placed?
      return 'Invalid movement' unless ErrorChecker.valid_movement?(self)
      case position.face.direction
      when 'NORTH'
        position.y += 1
      when 'LEFT'
        position.x -= 1
      when 'RIGHT'
        position.x += 1
      when 'SOUTH'
        position.y -= 1
      end
    end
  end
end
