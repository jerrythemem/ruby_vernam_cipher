# frozen_string_literal: true

def decode(result, mask)
  result.to_i(2) ^ mask.to_i(2)
end
