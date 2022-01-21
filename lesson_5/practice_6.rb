munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# name_keys = munsters.keys
# ages = munsters[name_key]['age']
# gender = munsters[name_key]['gender']

names = munsters.keys
index = 0

loop do
  break if index == names.size
  age = munsters[names[index]]['age']
  gender = munsters[names[index]]['gender']
  puts "#{names[index]} is a #{age} year old #{gender}"
  index += 1
end


