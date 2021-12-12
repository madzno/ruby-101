#what is != and where should you use it?
#put ! before something, like !user_name
#put ! after something, like words.uniq!
#put ? before something
#put ? after something
#put !! before something, like !!user_name

#1. "!=" is the not equal to operator and you should use it when you want to check if two objects are not equal. This operator returns
# a boolean object.
#2. "!", when used before an object, turns that object to its boolean opposite. For example, !true == false
#3. "!", when used after a method often, but not always, indicates that the method is destructive and will mutate its caller (not part of ruby syntax)
#4. "?", when used before an object
#5. "?" when used after a method often, but not always, indicates that the method will return a boolean object (not part of ruby syntax)
#6."!!" when used before an object turns that object into its boolean equivilent. For example, all objects in ruby are "truthy" except for
# false and nil so !!5 == true
