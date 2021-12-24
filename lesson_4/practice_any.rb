[1, 2, 3].any? do |num|
  puts num
  num.odd?
end

# the blocks return value in the following code is a boolean
# either true or false from calling the method .odd? on each element
# return value of any? is true. the block only outputs the first
# element 1.
