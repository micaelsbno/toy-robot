require 'toyrobot/robot'
require 'toyrobot/commands'
require 'table'

RSpec.describe ToyRobot::Commands do
  context '5x5 table' do
    let(:robot) { ToyRobot::Robot.new }
    let(:table) { Table.new(5) }

    describe '#place' do
      it 'raises an error if placing before the table' do
        position = { x: -1, y: -2, face: 'NORTH' }
        expect { robot.place(table, position) }
          .to raise_error(ArgumentError, 'Invalid command')
      end

      it 'raises an error if placing after the table' do
        position = { x: 6, y: 8, face: 'NORTH' }
        expect { robot.place(table, position) }
          .to raise_error(ArgumentError, 'Invalid command')
      end

      it 'raises an error if placing facing nowhere' do
        position = { x: 3, y: 4, face: 'nowhere' }
        expect { robot.place(table, position) }
          .to raise_error(ArgumentError, 'Invalid command')
      end
    end
  end
end
