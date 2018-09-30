require_relative 'commands'
require_relative '../table'

module ToyRobot
  # Creates a Robot
  class Robot < Commands
    attr_accessor :position

    def initialize
      @position = nil
    end

    def report
      if placed?
        "#{@position.x},#{@position.y},#{@position.face.direction}"
      else
        'Please, place the robot first'
      end
    end

    def placed?
      !@position.nil?
    end
  end
end
