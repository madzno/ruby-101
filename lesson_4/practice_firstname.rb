flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.each_with_index do |element, index|
  if element.start_with?("Be")
    p index
  end
end
