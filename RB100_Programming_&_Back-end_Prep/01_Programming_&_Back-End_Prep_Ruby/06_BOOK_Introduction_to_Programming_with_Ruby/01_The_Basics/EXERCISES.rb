#Exercises for Section 1 - 'The Basics'

#1 - Add two strings together that, when concatenated, return your first and last name as your full name in one string.
puts 'Justin ' + 'Simpson'

#2 - Use the modulo operator, division, or a combination of both to take a 4 digit number and find the digit in the: 1) thousands place 2) hundreds place 3) tens place 4) ones place
puts 1983 /1000, 1983 %1000 /100, 1983 %100 /10, 1983 %10

#3 - Write a program that uses a hash to store a list of movie titles with the year they came out. Then use the puts command to make your program print out the year of each movie to the screen. The output for your program should look something like this.
movies = {:movie1 => '1975', :movie1 => '2004', :movie1 => '2013', :movie1 => '2001', :movie1 => '1981'}

puts movies[:movie1], movies[:movie2], movies[:movie3], movies[:movie4], movies[:movie5]

#4 - Use the dates from the previous example and store them in an array. Then make your program output the same thing as exercise 3.
movie_array = [1975, 2004, 2013. 2001. 1981]

puts movie_array[0], movie_array[1], movie_array[2], movie_array[3], movie_array[4]

#5 - Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.
fact_5 = 5 *4 *3 *2
fact_6 = fact_5 * 6
fact_7 = fact_6 * 7
fact_8 = fact_7 * 8

puts fact_5, fact_6, fact_7, fact_8

#6 - Write a program that calculates the squares of 3 float numbers of your choosing and outputs the result to the screen.
float_num_1 = 4.182386
float_num_2 = .238765
gitfloat_num_3 = 21873.1

puts float_num_1 * float_num_1, float_num_2 * float_num_2, float_num_3 * float_num_3

#7 - What does the following error message tell you?
#SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
#  from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

#It appears that the user attempted to close a hash definition with a close-paren rather than a curly-close.