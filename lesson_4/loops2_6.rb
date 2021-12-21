names = ["Sally", "Joe", "Lisa", "Henry"]

#forward
loop do
  puts names.shift
  break if names.empty?
end

#backwards
# loop do
#   puts names.pop
#   break if names.empty?
# end
