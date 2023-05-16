class Task
  def initialize(task)
    @description = task
    @status = "incomplete"
  end

  def description
    @description
  end

  def status
    @status
  end
end