# frozen_string_literal: true

def decode(result, mask)
  puts 'Base is string or number?'
  answer = gets.chomp
  if answer == 'string'
    base_byte = result.to_i(2) ^ mask.to_i(2)
    decode_str(base_byte)
  elsif answer == 'number'
    result.to_i(2) ^ mask.to_i(2)
  end
end

def decode_str(base_byte)
  base_chr = base_byte.to_s(2).split ''
  base = ''
  sample = ''
  (0..base_chr.length - 1).each do |i|
    sample += base_chr[i].to_s
    if sample.length == 7
      base += sample.to_i(2).to_i.chr
      sample = ''
    end
  end
  base
end
