a = [1, 2, 3, 4, 5]
a.delete_at(1)
# deletes the object at index 1 in the current array (in this case, integer 2)
# is destructive, a = [1, 3, 4, 5]
# returns deleted item (2) = "modifies in place"

a = [1, 2, 3, 4, 5]
a.delete(1)
# deletes the integer 1 from the a array
# is destructive, a = [2, 3, 4, 5]
# returns deleted item (1) = "modifies in place"
