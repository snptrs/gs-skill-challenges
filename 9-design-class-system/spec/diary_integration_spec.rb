require 'diary'
require 'diary_entry'
require 'task'
require 'contact'

RSpec.describe Diary do

  context "when adding diary entries" do
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

end