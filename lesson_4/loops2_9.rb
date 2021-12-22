number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next unless number_b == 5 || number_a == 5
  puts "Number 5 was reached!"
  break
end


#further exploration
# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#   if number_b == 5 || number_a == 5
#     puts "Number 5 was reached!"
#     break
#   end
# end
