["ant", "bat", "caterpillar"].count do |str|
  str.length < 4
end

#count treats a block by counting the number of elements
# that yield a "true" value from the block
# found from Ruby Docs #Enumerable which is used by array class
# above code will return "2"
