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
      expect(diary.read_entries).to eq [diary_entry_1, diary_entry_2] # => ["First diary entry", "Second diary entry"]
    end
  end

end