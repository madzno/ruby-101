produce = {
  "apple" => "Fruit",
  "carrot" => "Vegetable",
  "pear" => "Fruit",
  "broccoli" => "Vegetable"
  }

# create an empty hash called "fruit hash"
# iterate through "fruit hash" and select the values are equal to "Fruit"
# add the key-value pairs that are equal to "Fruit" to the "fruit hash"
# stop iterating when the parameter hash is empty

  def select_fruit(hash)
    fruit_hash = {}
    return hash if hash.empty?
    hash.each do |key, value|
      fruit_hash[key] = "Fruit" if hash[key] == "Fruit"
    end
    fruit_hash
  end

p select_fruit(produce)
p select_fruit({})
