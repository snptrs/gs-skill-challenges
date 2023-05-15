class TodoList
  def initialize
    @todos = []
  end

  def add(todo)
    @todos << todo
  end

  def incomplete
    todos = @todos.filter do |todo|
      todo.done? == false
    end
    
    return todos.map! { |todo| todo.task }
  end

  def complete
    todos = @todos.filter do |todo|
      todo.done? == true
    end
    
    return todos.map! { |todo| todo.task }
  end

  def give_up!
    @todos.each { |todo| todo.mark_done! }
  end
end
