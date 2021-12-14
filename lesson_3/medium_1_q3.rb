def factors(number)
  divisor = number
  factors = []
  loop do
    if (number > 0) && (number % divisor == 0)
      factors << (number / divisor)
    else
      break
    end
    divisor -= 1
    break if divisor == 0
  end
  factors
end

#bonus 1, the purpose of number % divisor == 0 is a conditional that allows you to
# determine if a number is a factor (no remainder)

# the purpose of line 18, returning "factors" before the methods end is that we know the method's
# return value will be "factors" and not "nil" (what a "begin/end/untill" statement returns in Ruby)

# another way would be to do a while loop
# while divisor > 0 do
#  factors << number / divisor if number % divisor == 0
#  divisor -= 1
# end
