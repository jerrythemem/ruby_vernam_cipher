# frozen_string_literal: true

puts 'Enter data: '
input_data = gets.chomp
byte_inp_data = input_data.to_i.to_s(2) # Convert input data to binary

def encode(byte_inp_data, input_data)
  # Input check: if you enter char or string you will get 0 value from the upper statement, so
  # this check would convert every char from input to ASCII code and that code to binary
  if byte_inp_data == '0'
    char_inp_data = input_data.bytes
    char_inp_data.each do |char|
      byte_inp_data += char.to_s(2)
    end
  end
  puts 'Input data: ', byte_inp_data

  # Mask creating
  mask = ''
  (0..byte_inp_data.length - 1).each do |_|
    mask += rand.round.to_s
  end

  puts 'Mask: ', mask

  # XOR operation to get result
  result = byte_inp_data.to_i(2) ^ mask.to_i(2)
  puts 'Result:', result.to_s(2)

  puts 'Decode:'
  puts(decode(result, mask))
end

encode(byte_inp_data, input_data)
