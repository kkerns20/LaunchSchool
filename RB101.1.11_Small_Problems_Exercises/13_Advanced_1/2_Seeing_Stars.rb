=begin

Write a method that displays an 8-pointed star in an nxn grid, where n is an odd integer that is supplied as an argument to the method. The smallest such star you need to handle is a 7x7 grid.

Examples

star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *
star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *

=end

def star(int)
  int.times do |row|
    print_line = ''
    
    if row == int / 2
      print_line = '*' * int
    else
      int.times do |col|
        case col
        when row           then print_line << '*'
        when int / 2       then print_line << '*'
        when int - row - 1 then print_line << '*'
        else                    print_line << ' '
        end
      end
    end

    puts print_line
  end
end

star(7)
star(9)
