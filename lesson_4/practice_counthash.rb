statement = "The Flintstones Rock"

letters = statement.chars
letters.delete(" ")

letter_counts = {}

letters.each do |element|
  element_count = letters.count(element)
  letter_counts[element] = element_count
end

p letter_counts


