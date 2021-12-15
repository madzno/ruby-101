def fun_with_ids
  a_outer = 42 #ID 1
  b_outer = "forty two" # ID 2
  c_outer = [42] #ID 3
  d_outer = c_outer[0] #ID 1

  a_outer_id = a_outer.object_id # 1
  b_outer_id = b_outer.object_id # 2
  c_outer_id = c_outer.object_id # 3
  d_outer_id = d_outer.object_id #1

  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} before the block."
  #                    42                         1
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} before the block."
  #                  "forty two"                   2
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} before the block."
  #                  [42]                           3
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} before the block."
  #                    42                          1
  puts
                         #(42, "forty two", [42], 42, 1, 2, 3, 1)
  an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)


  puts "a_outer is #{a_outer} with an id of: #{a_outer_id} BEFORE and: #{a_outer.object_id} AFTER the method call."
  #                    42                           1                          1
  puts "b_outer is #{b_outer} with an id of: #{b_outer_id} BEFORE and: #{b_outer.object_id} AFTER the method call."
  #                  "forty two"                  2                             2
  puts "c_outer is #{c_outer} with an id of: #{c_outer_id} BEFORE and: #{c_outer.object_id} AFTER the method call."
  #                  [42]                         3                              3
  puts "d_outer is #{d_outer} with an id of: #{d_outer_id} BEFORE and: #{d_outer.object_id} AFTER the method call."
  #                  42                          1                              1
  puts

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} INSIDE and: #{a_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  #                   ugh ohhhh is outputed because there is no a_inner_id defined in the "an illustrative methods" self contained scope
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} INSIDE and: #{b_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} INSIDE and: #{c_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} INSIDE and: #{d_inner.object_id} AFTER the method." rescue puts "ugh ohhhhh"
  puts
end

                           #(42, "forty two", [42], 42, 1, 2, 3, 1)
def an_illustrative_method(a_outer, b_outer, c_outer, d_outer, a_outer_id, b_outer_id, c_outer_id, d_outer_id)

  puts "a_outer id was #{a_outer_id} before the method and is: #{a_outer.object_id} inside the method."
  #                       1                                              1
  puts "b_outer id was #{b_outer_id} before the method and is: #{b_outer.object_id} inside the method."
  #                       2                                              2
  puts "c_outer id was #{c_outer_id} before the method and is: #{c_outer.object_id} inside the method."
  #                       3                                           3
  puts "d_outer id was #{d_outer_id} before the method and is: #{d_outer.object_id} inside the method."
  #                         1                                          1
  puts

  a_outer = 22
  b_outer = "thirty three"
  c_outer = [44]
  d_outer = c_outer[0]

  puts "a_outer inside after reassignment is #{a_outer} with an id of: #{a_outer_id} before and: #{a_outer.object_id} after."
  #                                             22                          1                             4
  puts "b_outer inside after reassignment is #{b_outer} with an id of: #{b_outer_id} before and: #{b_outer.object_id} after."
  #                                             "Thirty three"                2                          5
  puts "c_outer inside after reassignment is #{c_outer} with an id of: #{c_outer_id} before and: #{c_outer.object_id} after."
  #                                              [44]                       3                           6
  puts "d_outer inside after reassignment is #{d_outer} with an id of: #{d_outer_id} before and: #{d_outer.object_id} after."
  #                                             44                          1                           7
  puts

  a_inner = a_outer # 22
  b_inner = b_outer # "thirty three"
  c_inner = c_outer # [44]
  d_inner = c_inner[0] #44

  a_inner_id = a_inner.object_id # 4
  b_inner_id = b_inner.object_id # 5
  c_inner_id = c_inner.object_id # 6
  d_inner_id = d_inner.object_id # 7

  puts "a_inner is #{a_inner} with an id of: #{a_inner_id} inside the method (compared to #{a_outer.object_id} for outer)."
  #                    22                         4                                                4
  puts "b_inner is #{b_inner} with an id of: #{b_inner_id} inside the method (compared to #{b_outer.object_id} for outer)."
  puts "c_inner is #{c_inner} with an id of: #{c_inner_id} inside the method (compared to #{c_outer.object_id} for outer)."
  puts "d_inner is #{d_inner} with an id of: #{d_inner_id} inside the method (compared to #{d_outer.object_id} for outer)."
  puts
end
