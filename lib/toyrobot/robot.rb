require_relative 'commands/commands'

module ToyRobot

  class Robot < Commands

    attr_accessor :x, :y, :face

    def initialize
      @x = nil
      @y = nil
      @face = nil
    end  

    def report
      placed? ? "#{@x},#{@y},#{@face}" : 'not placed'
    end

    def placed?
      !@x.nil? && !@y.nil? && !@face.nil?
    end
    
  end

end