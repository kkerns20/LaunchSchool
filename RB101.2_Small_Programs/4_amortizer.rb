def prompt(message)
  Kernel.puts("=> #{message}")
end

prompt "Welcome to the loan amortizer!"

principle = ''
loop do
  prompt "Please input loan amount."
  # principle = gets.to_i
  principle = 10000
  if principle > 0
    break
  end
  prompt "Must enter a positive amount."
end

j = ''
loop do
  prompt "Please enter loan APR (as a percent)."
  prompt "i.e. for 5%, enter 5; for 1.5%, enter 1.5, etc"
  # apr = gets.to_i / 100
  apr = 0.035
  if apr.empty? || apr < 0
    prompt "Must enter a positive number."
  else
    break
  end
  j = (1 + apr)**(1.0 / 12)
end

loop do
  prompt "Please enter loan duration (in years)."
  # n = gets.to_i * 12
  n = 60
  if n > 0
    break
  end
  prompt "Number of years must be a positive number."
end

m = principle * (j / (1 - (1 + j)**(-n)))

prompt "Your monthly payment amount should be #{format('$%02.2f', m)}."
