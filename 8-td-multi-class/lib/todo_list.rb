class TodoList
  def initialize
    @todos = []
  end

  def add(todo) # todo is an instance of Todo
    @todos << todo
  end

  def incomplete
    todos = @todos.filter do |todo|
      todo.done? == false
    end
    
    return todos.map! { |todo| todo.task }
  end

  def complete
    # Returns all complete todos
  end

  def give_up!
    # Marks all todos as complete
  end
end
