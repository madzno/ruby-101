numbers = [1, 2, 3, 4]
numbers.each_with_index do |number, index|
  p number
  numbers.shift(1)
end
# 1 3

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end
# 1 2

# modifying with destructive methods during iteration is not recommended and can
# result in unexpected behavior
#
