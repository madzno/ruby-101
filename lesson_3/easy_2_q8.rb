advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0..25)
puts advice

#advice.slice!(0, advice.index("house")) is an easier way without having to count every index
# the .slice method is non destructive so if used in the same way above the "puts advice" it would
# return the portion of the string being "sliced" (aka "Few thing in life are as important as")
#but the origional advice variable string would not be affected.

