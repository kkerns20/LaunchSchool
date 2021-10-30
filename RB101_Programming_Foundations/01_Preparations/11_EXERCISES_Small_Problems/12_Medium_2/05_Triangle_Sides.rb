=begin

A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length
To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

Examples:

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

=end

def triangle(flt_1, flt_2, flt_3)
  side_congruence = [flt_1 == flt_2, flt_1 == flt_3, flt_2 == flt_3]
  
  return :equilateral if side_congruence.count(true) == 3

  validity = flt_1 > 0 && flt_1 <= flt_2 + flt_3 &&
             flt_2 > 0 && flt_2 <= flt_1 + flt_3 &&
             flt_3 > 0 && flt_3 <= flt_1 + flt_2

  return :isosceles if validity && side_congruence.count(true) == 1
  return :scalene if validity && side_congruence.count(true) == 0
  :invalid
end

puts triangle(3, 3, 3) == :equilateral
puts triangle(3, 3, 1.5) == :isosceles
puts triangle(3, 4, 5) == :scalene
puts triangle(0, 3, 3) == :invalid
puts triangle(3, 1, 1) == :invalid
