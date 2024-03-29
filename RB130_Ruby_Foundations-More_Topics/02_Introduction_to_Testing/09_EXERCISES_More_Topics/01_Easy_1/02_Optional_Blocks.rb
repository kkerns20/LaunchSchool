=begin

Write a method that takes an optional block. If the block is specified, the method should execute it, and return the value returned by the block. If no block is specified, the method should simply return the String 'Does not compute.'.

Examples:

compute { 5 + 3 } == 8
compute { 'a' + 'b' } == 'ab'
compute == 'Does not compute.'

=end

def compute(arg)
  return 'Does not compute.' unless block_given?
  yield arg
end

p compute('string') { |arg| arg.capitalize }
p compute(5) { |arg| arg**2 }
p compute(Object.new)
