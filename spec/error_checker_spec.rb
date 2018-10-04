require 'toyrobot/robot'
require 'toyrobot/commands'
require 'table'
require 'toyrobot/error_checker'

RSpec.describe ToyRobot::ErrorChecker do
  context '5x5 table ' do
    let(:robot) { ToyRobot::Robot.new }
    let(:table) { Table.new(5) }

    describe '#valid_position?' do
      it 'returns true if the position is valid' do
        position = { x: 0, y: 0, face: 'NORTH' }
        expect(described_class.valid_position?(table, position)).to eql(true)
      end

      it 'returns false if x is higher than table x invalid' do
        position = { x: 6, y: 0, face: 'NORTH' }
        expect(described_class.valid_position?(table, position)).to eql(false)
      end

      it 'returns false if position is negative' do
        position = { x: -2, y: 0, face: 'NORTH' }
        expect(described_class.valid_position?(table, position)).to eql(false)
      end

      it 'returns false if coordinates is NOT an integer' do
        position = { x: 'two', y: 0, face: 'NORTH' }
        expect(described_class.valid_position?(table, position)).to eql(false)
      end

      it 'returns false if direction is not a string' do
        position = { x: 2, y: 0, face: 2 }
        expect(described_class.valid_direction?(position)).to eql(false)
      end

      it 'returns true even if face is lowercase' do
        position = { x: 2, y: 3, face: 'north' }
        expect(described_class.valid_position?(table, position)).to eql(true)
      end
    end

    describe '#valid_direction?' do
      it 'returns true if direction is north' do
        position = { x: 2, y: 3, face: 'north' }
        expect(described_class.valid_direction?(position)).to eql(true)
      end

      it 'returns false if facing invalid direction' do
        position = { x: 2, y: 3, face: 'wrong' }
        expect(described_class.valid_direction?(position)).to eql(false)
      end
    end

    describe '#valid_placing?' do
      it 'returns true if placed inside table with correct direction' do
        position = { x: 2, y: 3, face: 'NORTH' }
        expect(described_class.valid_placing?(table, position)).to eql(true)
      end

      it 'raises an ArgumentError (PlacingError) if placed outside the table with CORRECT direction' do
        position = { x: -2, y: 3, face: 'NORTH' }
        expect(described_class.valid_placing?(table, position)).to eql(false)
      end

      it 'raises an ArgumentError (PlacingError) if placed outside the table with WRONG direction' do
        position = { x: -2, y: -3, face: 'wrong' }
        expect(described_class.valid_placing?(table, position)).to eql(false)
      end

      it 'raises an ArgumentError (FacingError) if placed inside the table with WRONG direction' do
        position = { x: 2, y: 3, face: 'wrong' }
        expect(described_class.valid_placing?(table, position)).to eql(false)
      end
    end

    describe '#valid_movement?' do
      it 'returns true if moving inside the table' do
        position = { x: 2, y: 2, face: 'NORTH' }
        robot.place(table, position)
        expect(described_class.valid_movement?(robot)).to eql(true)
      end

      it 'returns false if moving beyond the table' do
        position = { x: 4, y: 4, face: 'NORTH' }
        robot.place(table, position)
        expect(described_class.valid_movement?(robot)).to eql(false)
      end

      it 'returns false if moving before the table' do
        position = { x: 0, y: 0, face: 'SOUTH' }
        robot.place(table, position)
        expect(described_class.valid_movement?(robot)).to eql(false)
      end

      it 'returns true if starting in the middle and moving close to the edge' do
        position = { x: 2, y: 2, face: 'NORTH' }
        robot.place(table, position)
        robot.move
        expect(described_class.valid_movement?(robot)).to eql(true)
      end

      it 'returns false if starting in the middle and moving to the edge' do
        position = { x: 2, y: 2, face: 'NORTH' }
        robot.place(table, position)
        robot.move
        robot.move
        expect(described_class.valid_movement?(robot)).to eql(false)
      end

      it 'returns message if robot was not placed yet' do
        expect(described_class.valid_movement?(robot)).to eql('Please, place the robot first')
      end
    end
  end
end
