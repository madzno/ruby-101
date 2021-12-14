limit_outside = 15

def fib(first_num, second_num, limit_inside)
  while first_num + second_num < limit_inside
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, limit_outside)
puts "result is #{result}"

# the limit variable that is initalized on the outside of the method is not available
# in the method due to method definition's self contained scope
