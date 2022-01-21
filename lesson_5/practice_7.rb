a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

arr = [2, [5, 8]]

arr = [4, []]

# 'a' #=> 2
# 'b' #= 3

# 'a' did not change because indexed assignment `arr[0]` is mutating to the
# array object `arr` but NOT the integer '2'. Integers are immutable so unless
# we are referencing `a` and re-assigning `a` a new value, we are not changing 'a'
# at any point.
# arr[1][0] is mutating because `b` is an array and we are modifying it by
# assigning a new value at index 0 using index assignment which is mutating
