arr =[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

arr.map do |sub_hash|
  sub_hash.each do |key, value|
    incremented_hash[key] = value + 1
  end
  incremented_hash
end

# key thing here is to return an incremented array without modifying the first one
# therefore cannot simply use map on line 4 and do sub_hash[key] = value
# need to create a new incremented hash variable and then return this
# after each since each returns the original collection



