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

  def complete(task_number) # task_id is an integer
    # Throws an error if no task_number given
    # Returns a string confirming task marked as complete
  end
end