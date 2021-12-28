{ a: "ant", b: "bear" }.map do |key, value|
  if value.size > 3
    value
  end
end

#map always rturns the return value of the block in an array
# therefore the above code will return [nil, "bear"]
