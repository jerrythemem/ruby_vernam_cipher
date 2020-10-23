def smart_encode_convert(input_data)
  convert_temp = ''
  convert_data = ''
  (0..input_data.length - 1).each do |i|
    if check_if_num(input_data[i])
      if convert_temp == ''
        convert_temp += input_data[i]
      else
        if check_if_num(convert_temp[0])
          convert_temp += input_data[i]
        else
          convert_data += convert_chars(convert_temp)
          convert_temp = input_data[i]
        end
      end
    else
      if check_if_num(convert_temp[0])
        convert_data += convert_nums(convert_temp)
        convert_temp = input_data[i]
      else
        convert_temp += input_data[i]
      end
    end
    next unless i == input_data.length - 1

    convert_data += if check_if_num(convert_temp[0])
                      convert_nums(convert_temp)
                    else
                      convert_chars(convert_temp)
                    end
  end
  convert_data
end

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
