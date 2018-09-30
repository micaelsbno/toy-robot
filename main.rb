require_relative 'lib/toyrobot/robot'
require_relative 'lib/table'

puts <<-HEADER
  -------------------------
  Welcome to the ToyRobot
  -------------------------
  FIRST PLACE YOUR ROBOT

  HEADER

robot = ToyRobot::Robot.new
table = Table.new(5)

response = gets.chomp || 'nothing'

def format_response(response)
  res = response.split[1..-1].join.split(',')
  { x: res[0].to_i, y: res[1].to_i, face: res[2] }
end

while response.upcase != 'EXIT' do
  response.empty? ? response = 'invalid input' : response
  begin
    case response.split(' ')[0].upcase
    when 'PLACE'
      puts robot.place(table, format_response(response))
    when 'MOVE'
      puts robot.move
    when 'REPORT'
      puts robot.report
    when 'LEFT'
      puts robot.rotate_left
    when 'RIGHT'
      puts robot.rotate_right
    else
      puts 'Invalid Input'
    end
  rescue => exception
    puts "Error: #{exception.message}"
  end
   response = gets.chomp
   response = 'Invalid' unless response.is_a?(String)
end
