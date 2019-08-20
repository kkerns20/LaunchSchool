#Exercises for Section 1 - 'The Basics'

#1
puts 'Justin ' + 'Simpson'

#2
puts 1983 /1000, 1983 %1000 /100, 1983 %100 /10, 1983 %10

#3
movies = {:movie1 => '1975', :movie1 => '2004', :movie1 => '2013', :movie1 => '2001', :movie1 => '1981'}

puts movies[:movie1], movies[:movie2], movies[:movie3], movies[:movie4], movies[:movie5]

#4
movie_array = [1975, 2004, 2013. 2001. 1981]

puts movie_array[0], movie_array[1], movie_array[2], movie_array[3], movie_array[4]

#5
fact_5 = 5 *4 *3 *2
fact_6 = fact_5 * 6
fact_7 = fact_6 * 7
fact_8 = fact_7 * 8

puts fact_5, fact_6, fact_7, fact_8

#6
float_num_1 = 4.182386
float_num_2 = .238765
gitfloat_num_3 = 21873.1

puts float_num_1 * float_num_1, float_num_2 * float_num_2, float_num_3 * float_num_3

#7
#SyntaxError: (irb):2: syntax error, unexpected ')', expecting '}'
#  from /usr/local/rvm/rubies/ruby-2.0.0-rc2/bin/irb:16:in `<main>'

#It appears that the user attempted to close a hash definition with a close-paren rather than a curly-close.