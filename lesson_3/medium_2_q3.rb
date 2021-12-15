def tricky_method(a_string_param, an_array_param)
  a_string_param += "rutabaga"
  an_array_param << "rutabaga"
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

# pumpkins - re-assignment is not mutating to the original object "My_string" that is passed into the tricky_method
# ["pumpkins", "ruttabaga"] - << is mutating to the original my_array that is passed into the tricky_method
# so the original my_array variable is affected while the original my_string is not.

