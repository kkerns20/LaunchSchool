class Element
  def initialize(obj, pointer=nil)
    @obj = obj
    @pointer = pointer
  end

  def datum
    @obj
  end

  def tail?
    @pointer.nil?
  end

  def next
    @pointer
  end
end

class SimpleLinkedList
  attr :head

  def self.from_a(array)
    array = [] if array.nil?
    output = new
    return output if array.nil?
    array.reverse_each do |obj|
      output.push(obj)
    end
    output
  end

  def to_a
    return [] if size == 0
    output = [peek]
    next_on_list = @head.next
    until next_on_list.nil?
      output << next_on_list.datum
      next_on_list = next_on_list.next
    end
    output
  end

  def initialize(structure=nil)
    @head = structure
  end

  def size
    return 0 unless @head
    size_of_list = 1
    next_on_list = @head.next
    until next_on_list.nil?
      size_of_list += 1
      next_on_list = next_on_list.next
    end
    size_of_list
  end

  def empty?
    @head.nil?
  end

  def push(obj)
    @head = Element.new(obj, @head)
  end

  def peek(element=@head)
    return nil unless element
    element.datum
  end

  def pop
    return_val = @head.datum
    @head = @head.next
    return_val
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end
end