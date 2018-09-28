require "toyrobot/robot"
require "toyrobot/commands/commands"
require "table"

require 'pry'
RSpec.describe ToyRobot::Commands do

  context 'Robot is placed in the middle of the board facing NORTH' do
    robot = ToyRobot::Robot.new
    table = Table.new(5)
    position = {x: 2, y: 2, face: 'NORTH'}
    robot.place(table, position)
    subject { robot }
    describe '#move' do
      it 'moves once without changing direction' do
        subject.move
        expect(subject.report).to eql('2,3,NORTH')
      end

      it 'tries to move beyond the table' do
        4.times do subject.move end
        expect(subject.report).to eql('4,4,NORTH')
      end
    end
  end
end