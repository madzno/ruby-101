require "yaml"
MESSAGES = YAML.load_file("calculator_messages.yml")

def prompt(message)
  puts "=> #{message}"
end

def valid_number?(num)
  num.to_f.to_s == num || num.to_i.to_s == num
end

def operation_to_message(op)
  case op
  when "1"
    "Adding"
  when "2"
    "Subtracting"
  when "3"
    "Multiplying"
  when "4"
    "Dividing"
  end
end

prompt(MESSAGES["welcome"])

name = ""
loop do
  name = gets.chomp
  if name.empty?
    prompt(MESSAGES["valid_name"])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  first_number = ""
  loop do
    prompt(MESSAGES["first_operand"])
    first_number = gets.chomp
    if valid_number?(first_number)
      break
    else
      prompt(MESSAGES["operand_error"])
    end
  end

  second_number = ""
  loop do
    prompt(MESSAGES["second_operand"])
    second_number = gets.chomp
    if valid_number?(second_number)
      break
    else
      prompt(MESSAGES["operand_error"])
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG

  prompt(operator_prompt)
  operator = ""

  loop do
    operator = gets.chomp
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(MESSAGES["operator_error"])
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers ...")

  result = case operator
           when "1"
             first_number.to_i + second_number.to_i
           when "2"
             first_number.to_i - second_number.to_i
           when "3"
             first_number.to_i * second_number.to_i
           when "4"
             first_number.to_f / second_number.to_f
           end

  prompt("The answer is #{result}")

  prompt(MESSAGES["perform_another"])
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt(MESSAGES["goodbye"])
