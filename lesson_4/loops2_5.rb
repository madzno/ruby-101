numbers = []

loop do
  puts "enter any number:"
  input = gets.chomp.to_i
  numbers << input
  break if numbers.length == 5
end

p numbers
