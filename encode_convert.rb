# frozen_string_literal: true

def smart_encode_convert(input_data)
  convert_temp = ''
  convert_data = ''
  (0..input_data.length - 1).each do |i|
    convert_temp, convert_data = cycle_main_check(convert_temp, convert_data, input_data[i])
    next unless i == input_data.length - 1

    convert_data += convert_data_last_assign(convert_temp)
  end
  convert_data
end

# Refractoring methods
def check_and_convert_chars(convert_temp, convert_data, input_data_i)
  if check_if_num(convert_temp[0])
    convert_temp += input_data_i
  else
    convert_data += convert_chars(convert_temp)
    convert_temp = input_data_i
  end
  [convert_temp, convert_data]
end

def check_and_convert_nums(convert_temp, convert_data, input_data_i)
  if check_if_num(convert_temp[0])
    convert_data += convert_nums(convert_temp)
    convert_temp = input_data_i
  else
    convert_temp += input_data_i
  end
  [convert_temp, convert_data]
end

def convert_data_last_assign(convert_temp)
  if check_if_num(convert_temp[0])
    convert_nums(convert_temp)
  else
    convert_chars(convert_temp)
  end
end

def cycle_main_check(convert_temp, convert_data, input_data_i)
  if check_if_num(input_data_i)
    if convert_temp == ''
      convert_temp += input_data_i
    else
      convert_temp, convert_data = check_and_convert_chars(convert_temp, convert_data, input_data_i)
    end
  else
    convert_temp, convert_data = check_and_convert_nums(convert_temp, convert_data, input_data_i)
  end
  [convert_temp, convert_data]
end

# Main encode_convert methods
def check_if_num(input_char)
  nums = %w[1 2 3 4 5 6 7 8 9 0]
  result = false
  nums.each do |num|
    if input_char == num
      result = true
      break
    end
  end
  result
end

def convert_nums(convert_temp)
  convert_temp.to_i.to_s(2)
end

def convert_chars(convert_temp)
  byte_chars = ''
  char_data = convert_temp.bytes
  char_data.each do |char|
    byte_chars += char.to_s(2)
  end
  byte_chars
end
