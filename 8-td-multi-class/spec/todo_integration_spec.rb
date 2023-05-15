require 'todo'
require 'todo_list'

RSpec.describe "integration" do
  context "after adding some entries" do
    it "lists one added entry" do
      todo = Todo.new("Buy tomatoes")
      todo_list = TodoList.new
      todo_list.add(todo)
      expect(todo_list.incomplete).to eq ["Buy tomatoes"]
    end

    it "lists multiple added entries" do
      todo_1 = Todo.new("Buy tomatoes")
      todo_2 = Todo.new("Buy bread")
      todo_3 = Todo.new("Wash the cat")
      todo_list = TodoList.new
      todo_list.add(todo_1)
      todo_list.add(todo_2)
      todo_list.add(todo_3)
      expect(todo_list.incomplete).to eq ["Buy tomatoes", "Buy bread", "Wash the cat"]
    end
  end
end