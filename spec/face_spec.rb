require 'toyrobot/face'


RSpec.describe ToyRobot::Face do
  
  context 'placed facing north' do
  
  subject { described_class.new('NORTH') }

    describe '#rotate_right' do
      it 'rotates one time' do
        subject.rotate_right
        expect(subject.direction).to eql('RIGHT')
      end

      it 'rotates two times' do
        2.times do subject.rotate_right end
        expect(subject.direction).to eql('SOUTH')
      end

      it 'rotates three times' do
        3.times do subject.rotate_right end
        expect(subject.direction).to eql('LEFT')
      end

      it 'rotates four times' do 
        4.times do subject.rotate_right end
        expect(subject.direction).to eql('NORTH')
      end
    end

    describe '#rotate_left' do
      it 'rotates one time' do
        subject.rotate_left
        expect(subject.direction).to eql('LEFT')
      end

      it 'rotates two times' do
        2.times do subject.rotate_left end
        expect(subject.direction).to eql('SOUTH')
      end

      it 'rotates three times' do
        3.times do subject.rotate_left end
        expect(subject.direction).to eql('RIGHT')
      end

      it 'rotates four times' do
        4.times do subject.rotate_left end
        expect(subject.direction).to eql('NORTH')
      end

    end

  end

end