module ToyRobot
  # Defines the direction that the robot is facing
  class Face
    attr_accessor :direction

    def initialize(direction)
      @direction = direction.upcase
    end

    def rotate_right
      case direction
      when 'NORTH'
        @direction = 'RIGHT'
      when 'RIGHT'
        @direction = 'SOUTH'
      when 'SOUTH'
        @direction = 'LEFT'
      when 'LEFT'
        @direction = 'NORTH'
      end
    end

    def rotate_left
      case direction
      when 'NORTH'
        @direction = 'LEFT'
      when 'RIGHT'
        @direction = 'NORTH'
      when 'SOUTH'
        @direction = 'RIGHT'
      when 'LEFT'
        @direction = 'SOUTH'
      end
    end
  end
end
