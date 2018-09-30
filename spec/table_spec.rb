require 'table'

RSpec.describe Table do
  it 'creates a new 5x5 table' do
    table = Table.new(5)
    size = {x: table.x, y: table.y }
    expect(size).to eql({x: 5, y: 5})
  end

  it 'creates a new 10x10 table' do
    table = Table.new(10)
    size = {x: table.x, y: table.y }
    expect(size).to eql({x: 10, y: 10})
  end

  it 'throws an error if size is < 0' do
    expect { Table.new(-2) }.to raise_error(ArgumentError, 'Size must be an integer')
  end

  it 'throws an error if size is a string' do
    expect { Table.new('two') }.to raise_error(ArgumentError, 'Size must be an integer')
  end

  it 'throws an error if size is a float' do
    expect { Table.new(1.414) }.to raise_error(ArgumentError, 'Size must be an integer')
  end
end