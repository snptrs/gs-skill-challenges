require 'todo'

RSpec.describe Todo do
  context "when adding a task" do
    it "adds a task" do
      todo = Todo.new("Buy bread")
      expect(todo.task).to eq "Buy bread"
    end

    it "fails if no todo text provided" do
      expect { Todo.new("") }.to raise_error "No task text provided"
    end
  end

  context "when checking if a task is complete" do
    it "returns false if the task is incomplete" do
      todo = Todo.new("Buy bread")
      expect(todo.done?).to eq false
    end
    it "returns true if the task is complete" do
      todo = Todo.new("Buy bread")
      todo.mark_done!
      expect(todo.done?).to eq true
    end
  end
end