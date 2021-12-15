def fun_with_ids
  a_outer = 42 # integer 42 (same object ID as d_outer)
  b_outer = "forty two" #string 42
  c_outer = [42] # c outer is equal to the array represented by [42]
  d_outer = c_outer[0] # d outer is equal to the object at index locaton 0 in the c_outer array - integer 42 (same object ID as a_outer)

  a_outer_id = a_outer.object_id # a outer object ID = 1
  b_outer_id = b_outer.object_id # b outer object ID = 2
  c_outer_id = c_outer.object_id # c outer object ID = 3
  d_outer_id = d_outer.object_id # d outer object ID = 1

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block." # a outer is 42 with an object id of 1
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block." # b outer is "forty two" with an object id of 2
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block." # c outer is [42] with an object id of 3
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block." # d outer is c_outer[0] which = 42 with an object ID of 1
  puts

  1.times do
    a_outer_inner_id = a_outer.object_id # a outer innder id is = 1
    b_outer_inner_id = b_outer.object_id # b outer inner id is = 2
    c_outer_inner_id = c_outer.object_id # c outer inner id is = 3
    d_outer_inner_id = d_outer.object_id # d outer inner id is = 1

    puts "a_outer id was #{a_outer_id} before the block and is: #{a_outer_inner_id} inside the block." # id was 1 before and is 1 inside
    puts "b_outer id was #{b_outer_id} before the block and is: #{b_outer_inner_id} inside the block." # id was 2 before and is 2 inside
    puts "c_outer id was #{c_outer_id} before the block and is: #{c_outer_inner_id} inside the block." # id was 3 before and is 3 inside
    puts "d_outer id was #{d_outer_id} before the block and is: #{d_outer_inner_id} inside the block." # id was 1 before and is 1 inside
    puts

    a_outer = 22 # reassigns a_outer to 22 - new object ID which is 5 because '22' is a NEW VALUE
    b_outer = "thirty three" # reasigns a_outer to "thirty three" - new object ID which is 6 because 6 is a "new value"
    c_outer = [44] # reassigns c_outer to [44] - new object ID which is now 7
    d_outer = c_outer[0] # assigned to the item at c_outer[0] which is now 44 and object id 8

    puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
    # a outer inside after reasignment is 22 with an id of 1 before and 5 after
    puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
    # b outer inside after reassignment is "thirty three" with an id of 2 before and 6 after
    puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
    # c outer inside after reassignment is [44] with an id of 3 before and 7 after
    puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
    # d outer isnide after reasignment is 44 with an id of 1 before and 8 after
    puts


    a_inner = a_outer #22
    b_inner = b_outer #thirty three
    c_inner = c_outer # [44]
    d_inner = c_inner[0] #44

    a_inner_id = a_inner.object_id #5
    b_inner_id = b_inner.object_id #6
    c_inner_id = c_inner.object_id #7
    d_inner_id = d_inner.object_id #8

    puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the block (compared to #{a_outer.object_id} for outer)."
    #                    22                          5                                             5
    puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the block (compared to #{b_outer.object_id} for outer)."
    #                    "thirty three"              6                                             6
    puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the block (compared to #{c_outer.object_id} for outer)."
    puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the block (compared to #{d_outer.object_id} for outer)."
    puts
  end

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the block."
  #                    22                       1                            5
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the block."
  #                  "thirty three"               2                           6
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the block."
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the block."
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  #                   can't access a inner from outside the block - ugh ohhh will be outputed
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the block." rescue puts "ugh ohhhhh"
end
