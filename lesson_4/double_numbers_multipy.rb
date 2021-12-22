def multiply(numbers, multiplyer)
  counter = 0
  multiple_numbers = []
  loop do
    break if counter == numbers.size
    multiple_numbers << numbers[counter] * multiplyer
    counter += 1
  end
  multiple_numbers
end

my_numbers = [2, 4, 5, 7]
p multiply(my_numbers, 3)
