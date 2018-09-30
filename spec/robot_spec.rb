require 'toyrobot/robot'
require 'toyrobot/commands'
require 'table'

RSpec.describe ToyRobot::Robot do
  context 'on a 5x5 table' do
    let(:robot) { described_class.new }
    let(:table) { Table.new(5) }
    let(:position) { { x: 0, y: 0, face: 'NORTH' } }

    describe '#placed?' do
      it 'returns false if the robot IS NOT placed on a table' do
        expect(robot).to_not be_placed
      end
      it 'returns true if the robot IS placed on a table' do
        robot.place(table, position)
        expect(robot).to be_placed
      end
    end

    describe '#report' do
      it 'returns not placed if robot is not yet placed' do
        expect(robot.report).to eql('Please, place the robot first')
      end

      it 'returns position if robot is placed' do
        robot.place(table, position)
        expect(robot.report).to eql('0,0,NORTH')
      end

      it 'returns destination after moving twice and changing direction' do
        robot.place(table, position)
        robot.move
        robot.rotate_right
        robot.move
        expect(robot.report).to eql('1,1,RIGHT')
      end

      it 'returns destination after moving 5 times north, changing direction and moving again' do
        robot.place(table, position)
        5.times { robot.move }
        robot.rotate_right
        robot.move
        expect(robot.report).to eql('1,4,RIGHT')
      end

      it 'is in the top left corner after trying to go beyond the table' do
        robot.place(table, position)
        robot.rotate_right
        5.times { robot.move }
        robot.rotate_left
        5.times { robot.move }
        expect(robot.report).to eql('4,4,NORTH')
      end
    end
  end
end
