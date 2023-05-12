# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my tasks
I want a program that I can add todo tasks to and see a list of them.

As a user
So that I can focus on tasks to complete
I want to mark tasks as complete and have them disappear from the list.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class TaskList
  def initializer
    # No return value
  end

  def add_task(task) # task is a string
    # No return value
  end

  def list_tasks
    # Returns a list of the tasks added as strings
  end

  def mark_complete(task_number) # task_id is an integer
    # Returns nothing
    # Throws an error if task doesn't exist
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1
task_list = TaskList.new
task_list.list # => []

# 2
task_list = TaskList.new
task_list.add("Buy bread")
task_list.list # => "Buy bread"

# 3
task_list = TaskList.new
task_list.add("Buy bread")
task_list.add("Fly a kite")
task_list.list # => ["Buy bread", "Fly a kite"]

# 3
task_list = TaskList.new
task_list.add("Buy bread")
task_list.add("Fly a kite")
task_list.complete("Buy bread")
task_list.list # => "Fly a kite"

# 4
task_list = TaskList.new
task_list.complete("Make coffee") # => Error
```


## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._