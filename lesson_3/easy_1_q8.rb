flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

flintstones.to_a.flatten!.select {|element| element == "Barney" || element == 2}

#much easier answer is using the .assoc method flinstones.assoc("Barney")
