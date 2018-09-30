module ToyRobot

  class Face

    attr_accessor :direction

    def initialize(direction)
      @direction = direction
    end

    def rotate_right
      case self.direction
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
      case self.direction
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