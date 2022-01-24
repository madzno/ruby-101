=begin

Problem
Input; none
output; an UUID

Explicit rules
1. output is a string
2. Contains 32 hexadecimal characters
3. typically, broken into 5 sections
2a. first section - 8 characters
2b. second section - 4 characters
2c. third section - 4 characters
2d. fourth section - 4 characters
2e. fifth section - 12 characters
4. each section is seperated by a '-' character
5. each of the sections contains a randomized set of hexidecimal characters
5a. digits 0 - 9
5b. alphabetic characters a - f

Example
'f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91'

Data structure
Array

Algo
1. define a method display_uuid that does not take a parameter
2. initalize a variable uuid and assign it to an empty string
3. initalize a variable hexidecimal and assign it to digit options and alphabetic options
4. initalize a counter variable and set it equal to 0
5. initalize a loop
6. choose a random alphaneumeric digit from the hexidecimal array and append it to the
uuid string
7. exit loop when the length of the uuid string is = 0
8. assign the symbol '-' to index 8, 13, 18, 23
  9. initalize a helper method add_sections that takes a string parameter
  10. initalize a counter variable to the integer 8
  11. assign string[counter] to the symbol '-'
  12. add 5 to the counter integer
  13. break out of the loop when the counter is > 23
9. assign uuid to the return value of the add_sections variable called on itself
=end

def get_uuid
  uuid = ''
  hexidecimal = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b',
                   'c', 'd', 'e', 'f']
  counter = 0

  loop do
    uuid << hexidecimal.sample
    counter += 1
    break if counter == 32
  end
  uuid = add_sections(uuid)
end

def add_sections(string)
  counter = 8
  loop do
    string[counter] = '-'
    counter += 5
    break if counter > 23
  end
  string
end

p get_uuid


