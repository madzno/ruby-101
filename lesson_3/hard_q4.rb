def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_seperated_words == 4

    while dot_separated_words.size > 0 do
      word = dot_separated_words.pop
      return false unless is_an_ip_number?(word)
    end
  true
end

def valid_numbers?(input_string)
  input_string.to_i <= 225 && input_string.to_i >= 0
end


def is_an_ip_number?(string_of_numbers)
  split_numbers = string_of_numbers.split(".")
  return false if split_numbers.length != 4
  while split_numbers.length > 0
    word = split_numbers.pop
    return false unless valid_numbers?(word)
  end
  true
end

p is_an_ip_number?("0.225.65.2")
