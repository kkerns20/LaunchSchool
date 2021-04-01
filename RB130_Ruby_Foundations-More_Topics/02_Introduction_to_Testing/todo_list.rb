# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
    description == otherTodo.description &&
    done == otherTodo.done
  end
end

# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(obj_todo)
    raise TypeError, 'Can only add Todo objects' unless obj_todo.class == Todo

    @todos << obj_todo
  end
  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos
  end

  def done?
    @todos.all? { |todo| todo.done? }
  end

  def item_at(int=nil)
    raise ArgumentError unless int
    raise IndexError unless @todos.size > int

    @todos[int]
  end

  def mark_done_at(int=nil)
    item_at(int).done!
    return
  end

  def mark_undone_at(int=nil)
    item_at(int).undone!
    return
  end

  def done!
    @todos.each { |todo| todo.done! }
    return
  end

  def shift
    item, *@todos = @todos
    return item
  end

  def pop
    *@todos, item = @todos
    return item
  end

  def remove_at(int=nil)
    return shift if int == 0
    return pop if int == @todos.size
    item, @todos = item_at(int), @todos[0..int-1] + @todos[int+1..-1]
  end

  def to_s
    text = "---- Today's Todos ----\n"
    text << @todos.map(&:to_s).join("\n")
    text
  end

  def each
    counter = 0

    while counter < @todos.size do
      yield @todos[counter]
      counter += 1
    end

    self
  end

  def select
    results = TodoList.new(title)
    @todos.each do |todo|
      results.add(todo) if yield todo
    end

    results
  end

  def find_by_title(string)
    self.each { |todo| return todo if todo.title == string }

    nil
  end

  def all_done
    self.select { |todo| todo.done? }
  end

  def all_not_done
    self.select { |todo| !todo.done?}
  end

  def mark_done(string)
    self.each { |todo| (todo.done!; break) if todo.title == string }

    nil
  end

  def mark_all_done
    self.each { |todo| todo.done! }
  end

  def mark_all_undone
    self.each { |todo| todo.undone! }
  end
end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results