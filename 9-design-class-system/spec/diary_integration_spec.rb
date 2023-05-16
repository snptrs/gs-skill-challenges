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
    it "returns all the tasks" do
      diary = Diary.new
      task_1 = Task.new("Buy bread")
      task_2 = Task.new("Scritch a dog")
      diary.add_task(task_1)
      diary.add_task(task_2)
      expect(diary.view_tasks).to eq ["Buy bread", "Scritch a dog"]
    end

    it "returns just the incomplete tasks" do
      diary = Diary.new
      task_1 = Task.new("Buy bread")
      task_2 = Task.new("Scritch a dog")
      diary.add_task(task_1)
      diary.add_task(task_2)
      diary.complete_task(task_1)
      expect(diary.view_tasks).to eq ["Scritch a dog"]
    end
  end

  context "searches diary entries for phone numbers" do
    it "returns the phone numbers" do
      diary = Diary.new
      diary_entry_1 = DiaryEntry.new("5 January", "I met Josh today: 07123456789")
      diary_entry_2 = DiaryEntry.new("13 February", "Three word entry")
      diary_entry_3 = DiaryEntry.new("13 February", "Remember Mollie's number: 07000555666")
      diary.add_entry(diary_entry_1)
      diary.add_entry(diary_entry_2)
      diary.add_entry(diary_entry_3)
      expect(diary.view_contacts).to eq ["07123456789", "07000555666"]
    end
  end

end