=begin

Write a method that displays a 4-pointed diamond in an n x n grid, where n is an odd integer that is supplied as an argument to the method. You may assume that the argument will always be an odd integer.

Examples

diamond(1)

*
diamond(3)

 *
***
 *
diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

=end

def diamond(int)
  1.upto(int) do |x|
    puts ('*' * x).center(int, ' ') if x.odd?
  end

  int.downto(1) do |x|
    puts ('*' * x).center(int, ' ') if x.odd? && x != int
  end
end

diamond(1)
diamond(3)
diamond(9)
