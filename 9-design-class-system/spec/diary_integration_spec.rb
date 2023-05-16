require 'diary'
require 'diary_entry'
require 'task'
require 'contact'

RSpec.describe Diary do

  context "having added some diary entries" do
    it "returns the added entries" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("5 January", "First diary entry")
      diary_entry_2 = DiaryEntry.new("13 February", "Second diary entry")
      diary.add_entry(diary_entry_1)
      diary.add_entry(diary_entry_2)
      expect(diary.read_entries).to eq [diary_entry_1, diary_entry_2]
    end

    it "returns a diary entry that can be read in the given time" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("5 January", "Diary entry of five words")
      diary_entry_2 = DiaryEntry.new("13 February", "Second diary entry")
      diary.add_entry(diary_entry_1)
      diary.add_entry(diary_entry_2)
      expect(diary.read_entry_of_length(1, 5)).to eq diary_entry_1
    end
  end

  context "having added some tasks" do
    it "returns the tasks" do
      diary = Diary.new
      task_1 = Task.new("Buy bread")
      task_2 = Task.new("Scritch a dog")
      diary.add_task(task_1)
      diary.add_task(task_2)
      expect(diary.view_tasks).to eq ["Buy bread", "Scritch a dog"]
    end
  end

end