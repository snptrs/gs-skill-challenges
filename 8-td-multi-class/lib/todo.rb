class Todo
  def initialize(task) # task is a string
    @todo = [task, ""]
  end

  def task
    @todo[0]
  end

  def mark_done!
    @todo[1] = "done"
  end

  def done?
    return @todo[1] == "done" ? true : false
  end
end
