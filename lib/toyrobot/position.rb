require_relative 'face'

module ToyRobot
  # Defines position of the robot when placed
  class Position
    attr_accessor :x, :y, :face, :table

    def initialize(table, position)
      @x = position[:x]
      @y = position[:y]
      @face = Face.new(position[:face])
      @table = table
    end
  end
end
