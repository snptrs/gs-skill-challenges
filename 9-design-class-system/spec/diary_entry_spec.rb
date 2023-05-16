require 'diary_entry'

RSpec.describe DiaryEntry do
  context "when given a value for words per minute" do
    it "returns an integer for time taken to read the entry" do
      diary_entry_1 = DiaryEntry.new("5 January", "First diary entry")
      expect(diary_entry_1.reading_time(1)).to eq 3
    end
  end
end