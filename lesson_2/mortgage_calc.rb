require "yaml"
MESSAGES = YAML.load_file("mortgage_messages.yml")

def prompt(message)
  puts "=>#{message}"
end

def validate_amount?(num)
  num.gsub!(/,/, "")
  num.to_i.to_s == num || num.to_f.to_s == num
end

name = ""
loop do
  prompt(MESSAGES["welcome"])
  name = gets.chomp
  if name.empty?
    puts prompt(MESSAGES["valid_name"])
  else
    break
  end
end

prompt("Hi #{name}!")

loop do
  amount = ""
  loop do
    prompt(MESSAGES["loan_amount"])
    amount = gets.chomp
    if validate_amount?(amount) && amount != "0"
      break
    else
      puts prompt(MESSAGES["valid_number"])
    end
  end

  apr = ""
  loop do
    prompt(MESSAGES["apr"])
    apr = gets.chomp
    if validate_amount?(apr) && apr != "0"
      break
    else
      puts prompt(MESSAGES["valid_number"])
    end
  end

  loan_years = ""
  loop do
    prompt(MESSAGES["loan_duration"])
    loan_years = gets.chomp
    if validate_amount?(loan_years) && loan_years != "0"
      break
    else
      puts prompt(MESSAGES["valid_number"])
    end
  end

  prompt(MESSAGES["calc_payment"])

  month_apr = ((apr.to_f) / 100) / 12
  loan_months = loan_years.to_i * 12

  payment = amount.to_i * (month_apr / (1 - (1 + month_apr)**(-loan_months)))

  prompt("Your monthly payment is #{payment}.")

  prompt(MESSAGES["another_calc"])
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt(MESSAGES["goodbye"])
