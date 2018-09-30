# This class creates tables
class Table
  attr_reader :x, :y

  def initialize(size)
    raise ArgumentError, 'Size must be an integer' unless size.is_a?(Integer) && size > 0
    @x = size
    @y = size
  end
end
