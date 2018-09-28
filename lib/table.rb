class Table
  
  attr_reader :x, :y

  def initialize (size)
    @x = size
    @y = size
  end

  def is_a_valid_position? (position)
    position[:x] <= @x &&
    position[:x] >= 0 &&
    position[:y] <= @y &&
    position[:y] >= 0 &&
    ['NORTH', 'SOUTH', 'LEFT', 'RIGHT'].include?(position[:face].upcase)
  end
end