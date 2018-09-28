require "toyrobot/robot"
require "toyrobot/commands/commands"
require "table"

RSpec.describe ToyRobot::Robot do

  context 'on a 5x5 table' do
    let(:robot) { described_class.new }
    let(:table) { Table.new(5) }

    describe '#placed?' do
      it 'returns false if the robot IS NOT placed on a table' do
        expect(robot.placed?).to eql(false)
      end
      it 'returns true if the robot IS placed on a table' do
        position = { x: 0, y: 0, face: 'NORTH' }
        robot.place(table, position)
        expect(robot.placed?).to eql(true)
      end
    end

    describe '#report' do
      it 'returns not placed if robot is not yet placed' do
        expect(robot.report).to eql('not placed')
      end

      it 'returns position if robot is placed' do
        position = { x: 0, y: 0, face: 'NORTH' }
        robot.place(table, position)
        expect(robot.report).to eql('0,0,NORTH')
      end
    end
  end
end