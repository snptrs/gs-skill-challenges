require 'task'

RSpec.describe Task do
  context "having added a task" do
    it "marks the task as done" do
      task = Task.new("Buy bread")
      task.done
      expect(task.status).to eq "complete"
    end
  end
end