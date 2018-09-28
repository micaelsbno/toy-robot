# require 'ToyRobot'
# require 'interface'

# RSpec.describe ToyRobot do

#   describe '#place' do
    
#     context 'inside the board facing north' do

#       it 'is placed in the bottom corner' do
#         robot = described_class.new(0,0,'NORTH')
#         expect(robot.report).to eql('0,0,NORTH')
#       end
#       it 'is placed in the middle' do
#         robot = described_class.new(2,2,'NORTH')
#         expect(robot.report).to eql('2,2,NORTH')
#       end
#       it 'is placed on the top right corner' do
#         robot = described_class.new(4,0,'NORTH')
#         expect(robot.report).to eql('4,0,NORTH')
#       end
#     end
    
#     context 'outside the board facing north' do
#       it 'is placed before the x axis' do
#         expect(described_class.new(-1,0,'NORTH')).to raise_error(RuntimeError, 'Robot Cannot be placed there')
#       end

#     end

#   end




# end
