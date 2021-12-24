[1, 2, 3].select do |num|
  num > 5
  "hi"
end

# return will be [1, 2, 3] because the block always returns a "truthy"
# value since the last line is "hi"
