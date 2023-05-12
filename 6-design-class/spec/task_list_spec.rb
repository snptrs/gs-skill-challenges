require 'task_list'

RSpec.describe TaskList do
  context "given no tasks" do
    it "has an empty list" do
      task_list = TaskList.new
      expect(task_list.list).to eq []
    end
  end

  context "given a task" do
    it "has the task in the list" do
      task_list = TaskList.new
      task_list.add("Buy bread")
      expect(task_list.list).to eq ["Buy bread"]
    end
  end

  context "given two tasks" do
    it "has the tasks in the list" do
      task_list = TaskList.new
      task_list.add("Buy bread")
      task_list.add("Fly a kite")
      expect(task_list.list).to eq ["Buy bread", "Fly a kite"]
    end
  end

  context "when completing a task" do
    it "removes the task from the list" do
      task_list = TaskList.new
      task_list.add("Buy bread")
      task_list.add("Fly a kite")
      task_list.complete("Buy bread")
      expect(task_list.list).to eq ["Fly a kite"]
    end
  end

  context "when trying to complete a non-existent task" do
    it "throws an error" do
      task_list = TaskList.new
      expect { task_list.complete("Make coffee") }.to raise_error "No such task"
    end
  end
end