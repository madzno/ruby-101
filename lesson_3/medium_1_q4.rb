def rolling_buffer1(buffer, max_buffer_size, new_element)
  buffer << new_element
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

def rolling_buffer2(input_array, max_buffer_size, new_element)
  buffer = input_array + [new_element]
  buffer.shift if buffer.size > max_buffer_size
  buffer
end

# yes there is a difference between rolling_buffer1 and rolling_buffer2
# rolling_buffer1 uses a method "<<" which is destructive and thus adds the new element
# origional array "buffer" permenantly
# with rolling_buffer 2 the "+" method is not destructive and thus the origional
# "input_array" will not be modified

def rolling_buffer3(input_array, max_buffer_size, new_element)
  input_array[max_buffer_size] = new_element
  input_array.shift if input_array.size > max_buffer_size
  input_array
end

a = [1, 2, 3, 4, 5]
p rolling_buffer2(a, 5, 6)
