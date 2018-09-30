require_relative 'face'

module ToyRobot
  
  class Position

    attr_accessor :x, :y, :face, :table

    def initialize(robot, table, position)
      @x = position[:x]
      @y = position[:y]
      @face = Face.new(position[:face])
      @table = table 
    end
    
  end
end