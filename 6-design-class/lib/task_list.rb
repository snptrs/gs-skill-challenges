class TaskList
  def initialize
    @task_list = []
  end

  def add(task)
    @task_list.push(task)
  end

  def list
    @task_list
  end

  def complete(task)
    fail "No such task" unless @task_list.include?(task)
    @task_list.delete(task)
  end
end