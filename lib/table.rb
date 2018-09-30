class Table
  
  attr_reader :x, :y

  def initialize (size)
    @x = size
    @y = size
  end

  def valid_position? (position)
    position[:x] <= @x &&
    position[:x] >= 0 &&
    position[:y] <= @y &&
    position[:y] >= 0
  end

  def valid_direction? (position)
    ['NORTH', 'LEFT', 'RIGHT', 'SOUTH'].include?(position[:face].upcase)
  end

  def valid_placing? (position)
    self.valid_position?(position) ? true &&
      self.valid_direction?(position) ? true 
      : raise(ArgumentError, 'Invalid facing direction')
    : raise(ArgumentError, 'Cannot place outside of table')
  end

end