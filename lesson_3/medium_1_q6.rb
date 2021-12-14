answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8

# outputs 34. answer is still pointing to its original object in memory "42"
