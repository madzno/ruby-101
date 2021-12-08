require "yaml"
MESSAGES = YAML.load_file("mortgage_messages.yml")

def prompt(message)
  puts "=>#{message}"
end

def validate_amount?(num)
  num.to_i.to_s == num || num.to_f.to_s == num
end

def get_loan_amount(num_amount)
  loop do
    prompt(MESSAGES["loan_amount"])
    num_amount = gets.chomp.delete("$").delete(",")
    if validate_amount?(num_amount) && num_amount.to_i > 0
      break
    else
      prompt(MESSAGES["valid_number"])
    end
  end
  num_amount
end

def get_apr(percentage)
  loop do
    prompt(MESSAGES["apr"])
    percentage = gets.chomp
    if validate_amount?(percentage) && percentage.to_i > 0
      break
    else
      prompt(MESSAGES["valid_number"])
    end
  end
  percentage
end

def get_loan_duration(years)
  loop do
    prompt(MESSAGES["loan_duration"])
    years = gets.chomp
    if validate_amount?(years) && years.to_i > 0
      break
    else
      prompt(MESSAGES["valid_number"])
    end
  end
  years
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
  amount = get_loan_amount(amount)
  apr = get_apr(apr)
  loan_years = get_loan_duration(loan_years)
  prompt(MESSAGES["calc_payment"])
  month_apr = ((apr.to_f) / 100) / 12
  loan_months = loan_years.to_i * 12
  payment = amount.to_i * (month_apr / (1 - (1 + month_apr)**(-loan_months)))
  prompt("Your monthly payment is #{format('%.2f', payment)} and your loan
          will be #{loan_months} months in total.")
  prompt(MESSAGES["another_calc"])
  answer = gets.chomp
  break unless answer.downcase.start_with?("y")
end

prompt(MESSAGES["goodbye"])
