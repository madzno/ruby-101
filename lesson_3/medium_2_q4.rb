def tricky_method_two(a_string_param, an_array_param)
  a_string_param << 'rutabaga'
  an_array_param = ['pumpkins', 'rutabaga']
end

my_string = "pumpkins"
my_array = ["pumpkins"]
tricky_method_two(my_string, my_array)

puts "My string looks like this now: #{my_string}"
puts "My array looks like this now: #{my_array}"

#<< IS mutating so my_string now outputs "pumpkinsrutabaga"
# local re-assignment within a method is NON mutating to the outside local method
# it is referring to, thus my_array remains pointing to ["pumpkins", "rutabaga"]
