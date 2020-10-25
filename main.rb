# frozen_string_literal: true

require './encode'
require './decode'
require './encode_convert'

loop do
  puts 'You want to encode or decode? For exit type "exit" '
  answer = gets.chomp
  if answer == 'encode'
    puts 'Enter data: '
    input_data = gets.chomp
    byte_inp_data = smart_encode_convert(input_data)
    puts "Result: #{encode(byte_inp_data, input_data)}"
  end

  if answer == 'decode'
    puts 'Enter result: '
    input_result = gets.chomp
    puts 'Enter mask: '
    input_mask = gets.chomp
    puts "Base: #{decode(input_result, input_mask)}"
  end

  break if answer == 'exit'
end
