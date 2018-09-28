require_relative 'ToyRobot'

require 'pry'

puts <<~DRAWING
  ------------------------
  Welcome to the Toy Robot
  -------------------------
  FIRST PLACE YOUR ROBOT

  DRAWING

response = gets.chomp

def place (response)
  response.split[1..-1].join.split(',')
  puts "1,3,NORTH"
end


while response != 'EXIT' do
    case response.split[0]
      when 'PLACE'
        place(response)
      else
        'nothing'
    end
    response = gets.chomp

end


