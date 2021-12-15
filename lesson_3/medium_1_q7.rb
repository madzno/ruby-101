munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)

# yes the family's data did get changed. The Hash#[]= is a setter method
# and destructively adds 42 to all of the ages in the munsters hash
# and all of the geners to "other". Also the parameter "demo_hash" is not re-assigned within the method
# so it points directly at the munsters hash when the munsters hash is passed into the method
# and thus the munsters hash itself is affected
