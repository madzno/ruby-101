words = "the flintstones rock"

def title(sentence)
  words_array = sentence.split(" ")

  words_array.map do |word|
    word[0] = word[0].capitalize
  end

 words_array.join(" ")
end

p title(words)


# words.split.map { |word| word.capitalize }.join(" ")
