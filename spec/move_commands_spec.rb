require "toyrobot/robot"
require "toyrobot/commands"
require "table"

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
        6.times do subject.move end
        expect(subject.report).to eql('2,4,NORTH')
      end
    end
  end

  context 'Robot is placed in the middle of the board facing RIGHT' do
    robot = ToyRobot::Robot.new
    table = Table.new(5)
    position = {x: 2, y: 2, face: 'RIGHT'}
    robot.place(table, position)
    subject { robot }
    describe '#move' do
      it 'moves once without changing direction' do
        subject.move
        expect(subject.report).to eql('3,2,RIGHT')
      end

      it 'tries to move beyond the table' do
        6.times do subject.move end
        expect(subject.report).to eql('4,2,RIGHT')
      end
    end
  end

  context 'Robot is placed in the middle of the board facing SOUTH' do
    robot = ToyRobot::Robot.new
    table = Table.new(5)
    position = { x: 2, y: 2, face: 'SOUTH' }
    robot.place(table, position)
    subject { robot }
    describe '#move' do
      it 'moves once without changing direction' do
        subject.move
        expect(subject.report).to eql('2,1,SOUTH')
      end

      it 'tries to move beyond the table' do
        6.times do subject.move end
        expect(subject.report).to eql('2,0,SOUTH')
      end
    end
  end

  context 'Robot is placed in the middle of the board facing LEFT' do
    robot = ToyRobot::Robot.new
    table = Table.new(5)
    position = {x: 2, y: 2, face: 'LEFT'}
    robot.place(table, position)
    subject { robot }
    describe '#move' do
      it 'moves once without changing direction' do
        subject.move
        expect(subject.report).to eql('1,2,LEFT')
      end

      it 'tries to move beyond the table' do
        6.times do subject.move end
        expect(subject.report).to eql('0,2,LEFT')
      end
    end
  end

end