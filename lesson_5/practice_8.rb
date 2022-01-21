hsh = {first: ['the', 'quick'],
        second: ['brown', 'fox'],
        third: ['jumped'],
        fourth: ['over', 'the', 'lazy', 'dog']
        }

hsh.each do |_, value|
  value.map do |string|
    value = string.chars
  end
  value.each do |character|
    puts character if ['a', 'e', 'i', 'o', 'u'].include?(character)
  end
end


