class CustomSet
  include Enumerable

  def initialize(array=[])
    @set = array.uniq
  end

  def add(obj)
    @set << obj unless contains?(obj)
    self
  end

  def empty?
    @set.empty?
  end

  def contains?(obj)
    @set.include?(obj)
  end

  def subset?(other_set)
    each do |elem|
      return false unless other_set.contains?(elem)
    end

    true
  end

  def disjoint?(other_set)
    each do |elem|
      return false if other_set.contains?(elem)
    end

    true
  end

  def intersection(other_set)
    CustomSet.new(@set.select { |elem| other_set.contains?(elem) })
  end

  def difference(other_set)
    CustomSet.new(@set.reject { |elem| other_set.contains?(elem) })
  end

  def union(other_set)
    all_shared = other_set.difference(self).each_with_object(@set.dup) { |elem, obj| obj << elem }
    CustomSet.new(all_shared)
  end

  def eql?(other_set)
    @set.sort == other_set.sort
  end

  def ==(other_set)
    eql?(other_set)
  end

  def each
    @set.each do |elem|
      yield elem
    end
  end
end
