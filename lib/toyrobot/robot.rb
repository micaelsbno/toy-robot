require_relative 'commands'

module ToyRobot

  class Robot < Commands

    attr_accessor :position

    def initialize
      @position = nil
    end  

    def report
      placed? ? "#{@position.x},#{@position.y},#{@position.face.direction}" : 'not placed'
    end

    def placed?
      !@position.nil?
    end
    
  end

end