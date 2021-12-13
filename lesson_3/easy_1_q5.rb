(10..100).include?(42)

(10..100).cover?(42)

# include? acts like cover? when begin and end values are numeric
# if you need to ensure that the object is between begin and end, use cover?
