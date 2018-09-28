require "toyrobot/robot"
require "toyrobot/commands/commands"
require "table"

require 'pry'
RSpec.describe ToyRobot::Commands do

  describe '#is_a_valid_position?' do
    
    context '5x5 table ' do
      let(:robot) { ToyRobot::Robot.new }
      let(:table) { Table.new(5) }

      it 'returns true if the position is valid' do
        position = {x: 0, y: 0, face: 'NORTH'}
        expect(table.is_a_valid_position?(position)).to eql(true)
      end

      it 'returns false if x is higher than table x invalid' do
        position = {x: 6, y: 0, face: 'NORTH'}
        expect(table.is_a_valid_position?(position)).to eql(false)
      end

      it 'returns false if position is negative' do
        position = { x: -2, y: 0, face: 'NORTH' }
        expect(table.is_a_valid_position?(position)).to eql(false)
      end

      it 'returns false if facing invalid position' do
        position = { x: 2, y: 3, face: 'wrong' }
        expect(table.is_a_valid_position?(position)).to eql(false)
      end

      it 'returns true even if face is lowercase' do
        position = { x: 2, y: 3, face: 'north' }
        expect(table.is_a_valid_position?(position)).to eql(true)
      end

    end
  end

end