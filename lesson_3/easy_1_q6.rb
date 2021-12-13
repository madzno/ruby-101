famous_words = "seven years ago..."

"Four score and #{famous_words}"

"Four score and " + famous_words #non mutating

famous_words.prepend("Four score and ") #mutating

"four score and " << famous_words #mutating
