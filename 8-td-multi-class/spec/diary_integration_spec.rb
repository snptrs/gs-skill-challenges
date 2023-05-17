require 'diary'
require 'diary_entry'

RSpec.describe "integration" do
  context "given two diary entries" do
    it "returns a list of all diary entries" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Title_1", "Contents_1")
      entry_2 = DiaryEntry.new("Title_2", "Contents_2")
      diary.add(entry_1)
      diary.add(entry_2)
      expect(diary.all).to eq [entry_1, entry_2]
    end
  end

  context "given 3 diary entries" do  
    it "returns a reading time of 3 when given wpm of " do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Title_1", "Contents_1")
      entry_2 = DiaryEntry.new("Title_2", "Contents_2")
      entry_3 = DiaryEntry.new("Title_3", "one two three")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect(diary.reading_time(2)).to eq 3
    end
    
    it "returns 1" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Title_1", "one two three four five six")
      entry_2 = DiaryEntry.new("Title_2", "one two")
      entry_3 = DiaryEntry.new("Title_3", "one two three")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect(diary.reading_time(11)).to eq 1
    end

    it "fails" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Title_1", "one two three four five six")
      entry_2 = DiaryEntry.new("Title_2", "one two")
      entry_3 = DiaryEntry.new("Title_3", "one two three")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect{diary.reading_time(-2)}.to raise_error "Error: wpm should be a non-negative integer" 
    end
  end

  context "#find_best_entry_for_reading_time" do
    it "should return the closest entry which could be read within the time given" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Title_1", "1 2 3 four five six")
      entry_3 = DiaryEntry.new("Title_3", "one two three")
      entry_2 = DiaryEntry.new("Title_2", "one 2")
      diary.add(entry_1)
      diary.add(entry_2)
      diary.add(entry_3)
      expect(diary.find_best_entry_for_reading_time(3, 1)).to eq entry_3
    end

    it "should return the closest entry which could be read within the time given" do
      diary = Diary.new
      entry_1 = DiaryEntry.new("Title_1", "1 2 3 four five six seven eight")
      entry_3 = DiaryEntry.new("Title_3", "one two three four five")
      entry_2 = DiaryEntry.new("Title_2", "one two")
      entry_4 = DiaryEntry.new("Title_4", "one 2")
      diary.add(entry_1)
      diary.add(entry_3)
      diary.add(entry_2)
      diary.add(entry_4)

      expect(diary.find_best_entry_for_reading_time(1, 5)).to eq entry_3
    end
  end
end