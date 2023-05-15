require 'diary_entry'

RSpec.describe DiaryEntry do
  context "when creating a new diary entry" do
    it "returns a diary entry" do
      diary_entry = DiaryEntry.new("Monday", "Lorem ipsum.")
      expect(diary_entry.title).to eq "Monday"
      expect(diary_entry.contents).to eq "Lorem ipsum."
    end
  end

  context "when given a diary entry" do
    it "should return the number of words in the entry" do
      diary_entry = DiaryEntry.new("Monday", "Lorem ipsum.")
      expect(diary_entry.count_words).to eq 2
    end
    it "should return 0 for an empty entry" do
      diary_entry = DiaryEntry.new("Monday", "")
      expect(diary_entry.count_words).to eq 0
    end
  end

  context "when given a reading speed" do
    it "returns 3 when given wpm of 1 and text of 3" do
      diary_entry = DiaryEntry.new("Monday", "one two three")
      expect(diary_entry.reading_time(1)).to eq 3
    end 
    it "returns 3 for wpm 2 and text of 5" do
      diary_entry = DiaryEntry.new("Monday", "one two three foru five")
      expect(diary_entry.reading_time(2)).to eq 3
    end
    it "returns 0 for wpm 2 and text of 0" do
      diary_entry = DiaryEntry.new("Title", "")
      expect(diary_entry.reading_time(2)).to eq 0
    end
    it "fails unless wpm is positive" do
      diary_entry = DiaryEntry.new("Title", "one two three")
      expect{diary_entry.reading_time(-1)}.to raise_error ("Error")
    end
  end

  context "when give a reading speed and number of minutes" do
    it "returns a chunk for wpm of 1 and minutes of 2" do
      diary_entry = DiaryEntry.new("Title", "one two three")
      expect(diary_entry.reading_chunk(1, 2)).to eq "one two"
    end

    it "returns a chunk that can be read in that time" do
      diary_entry = DiaryEntry.new("Title", "one two three")
      diary_entry.reading_chunk(2, 1)
      diary_entry.reading_chunk(2, 1)
      expect(diary_entry.reading_chunk(2, 1)).to eq "one two"
    end

    it "fails when given negative wpm" do
      diary_entry = DiaryEntry.new("Title", "one two three")
      expect{diary_entry.reading_chunk(-1, 1)}.to raise_error ("Error. Parameter should be above 0!")
    end

    it "fails when given negative minutes" do
      diary_entry = DiaryEntry.new("Title", "one two three")
      expect{diary_entry.reading_chunk(1, -1)}.to raise_error("Error. Parameter should be above 0!")
    end
  end
end