# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result
puts "Welcome to Calculator!"

puts "Enter your first operand"
first_number = gets.chomp

puts "Enter your second operand"
second_number = gets.chomp

puts "What operation do you want to perform? Please enter +, -, *, or /"
operator = gets.chomp 

if operator == "+"
  add_result = first_number.to_i + second_number.to_i
  puts "The result is #{add_result}!"
elsif operator == "-"
  subtract_result = first_number.to_i - second_number.to_i
  puts "The result is #{subtract_result}!"
elsif operator == "*"
  multiplication_result = first_number.to_i * second_number.to_i
  puts "The result is #{multiplication_result}!"
else operator == "/" 
  division_result = first_number.to_f / second_number.to_f
  puts "The result is #{division_result} !"
end 

