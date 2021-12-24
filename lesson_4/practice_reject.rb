[1, 2, 3].reject do |num|
  puts num
end

#above block evaluates to "false" every time because the value of "puts num"
# is nil, therefore the above code will return [1, 2, 3]
