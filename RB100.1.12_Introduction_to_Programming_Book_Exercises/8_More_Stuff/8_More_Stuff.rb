#Exercises for Section 8 - 'More Stuff'

#1 - Write a program that checks if the sequence of characters "lab" exists in the following strings. If it does exist, print out the word.

arr = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

arr.each do |str|
    if str =~ /lab/
        puts "'lab' can be found in the string '#{str}'!"
    else
        puts "'lab' cannot be found here!"
    end
end

#2 - What will the following program print to the screen? What will it return?

def execute(&block)
    block
end
  
execute { puts "Hello from inside the execute method!" }

# The block is not called from the .call method, so nothing is put to console, and nothing is returned.

#3 - What is exception handling and what problem does it solve?

# It gives the program a graceful way to proceed with its task when it encounters an issue that would otherwise cause a crash.

#4 - Modify the code in exercise 2 to make the block execute properly.

def execute(&block)
    block.call
end
  
execute { puts "Hello from inside the execute method!" }

#5 - Why does the following code...

def execute(block)
    block.call
end
  
execute { puts "Hello from inside the execute method!" }

# Give us the following error when we run it?
  
# block.rb1:in `execute': wrong number of arguments (0 for 1) (ArgumentError)
# from test.rb:5:in `<main>'

# Omitting the ampersand makes Ruby think that this is a simple method definition.