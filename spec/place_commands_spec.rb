require "toyrobot/robot"
require "toyrobot/commands"
require "table"

RSpec.describe ToyRobot::Commands do

   context '5x5 table ' do
  
    let(:robot) { ToyRobot::Robot.new }
    let(:table) { Table.new(5) }

    describe '#valid_position?' do     

      it 'returns true if the position is valid' do
        position = { x: 0, y: 0, face: 'NORTH' }
        expect(table.valid_position?(position)).to eql(true)
      end

      it 'returns false if x is higher than table x invalid' do
        position = { x: 6, y: 0, face: 'NORTH' }
        expect(table.valid_position?(position)).to eql(false)
      end

      it 'returns false if position is negative' do
        position = { x: -2, y: 0, face: 'NORTH' }
        expect(table.valid_position?(position)).to eql(false)
      end

      it 'returns true even if face is lowercase' do
        position = { x: 2, y: 3, face: 'north' }
        expect(table.valid_position?(position)).to eql(true)
      end

    end

    describe '#valid_direction?' do

      it 'returns true if direction is north' do
        position = { x:2, y:3, face: 'north' }
        expect(table.valid_direction?(position)).to eql(true)
      end

      it 'returns false if facing invalid direction' do
        position = { x: 2, y: 3, face: 'wrong' }
        expect(table.valid_direction?(position)).to eql(false)
      end

    end
  
    describe '#place' do 

      it 'returns an error if placing before the table' do
        position = { x: -1, y: -2, face: 'NORTH' }
        expect { robot.place(table, position) }.to raise_error(ArgumentError, 'Cannot place outside of table')
      end

      it 'returns an error if placing after the table' do 
        position = { x: 6, y: 8, face: 'NORTH' }
        expect { robot.place(table,position) }.to raise_error(ArgumentError, 'Cannot place outside of table')
      end

      it 'returns an error if placing facing nowhere' do
        position = { x: 3, y: 4, face: 'nowhere' }
        expect { robot.place(table,position) }.to raise_error(ArgumentError, 'Invalid facing direction')
      end

    end

  end
end