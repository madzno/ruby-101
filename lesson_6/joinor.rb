=begin
Problem
Input; Array or an Array and Strings
Output; a string

Examples
See Below

Rules
1. input array is m ade up of integers in an increasing sequence
2. input array integers are whole and greater than 0
3. input array has 2 or more numbers and is not an empty array
4. strings can include symbols, letters, spaces
5. None of the examples have empty strings
6. if symbol is given, it is used as the seperator between numbers
if no symbol given a comma is used for seperation ','
8. if a word is given, it is used before the last number, if no
word is given 'or' is placed before the last number

Data structure
Array
String

Algo
1. define a method 'joinor' with three parameters; numbers, symbol, word
2. initalize a local variable 'characters' to the result of joining the characters
with spaces and then splitting this string into characters
3. iterate through the characters string and on odd indexes add the symbol destructivley
4. initalize a local variable last_element and assign the last element of the characters
array to that element
5. add the word with spaces in front and behind it to the last position of the array destructively
6. append last element onto the array
7. join the array to form the results_string
=end

def joinor(numbers, symbol = ', ', word = 'or')
  characters = numbers.join(' ').chars
  if numbers.size > 2
    characters.each_with_index do |character, index|
      characters[index] = symbol if index.odd?
    end
  end
  last_element = characters.pop
  result_string = characters.append(word << ' ', last_element).join
end

 p joinor([1, 2]) == "1 or 2"
 p joinor([1, 2, 3]) == "1, 2, or 3"
 p joinor([1, 2, 3], '; ') == "1; 2; or 3"
 p joinor([1, 2, 3], ', ', 'and') == "1, 2, and 3"
