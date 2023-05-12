require 'diary'

RSpec.describe DiaryEntry do
  context "when initialized" do
    it "accepts a title and contents" do
      entry = DiaryEntry.new("Monday", "Lorem ipsum dolor sit amet.")
    end
  end

  context "`title` method" do
    it "returns the entry title as a string" do
      entry = DiaryEntry.new("Monday", "Lorem ipsum dolor sit amet.")
      expect(entry.title).to eq "Monday"
    end
  end

  context "`contents` method" do
    it "returns the entry contents as a string" do
      entry = DiaryEntry.new("Monday", "Lorem ipsum dolor sit amet.")
      expect(entry.contents).to eq "Lorem ipsum dolor sit amet."
    end
  end

  context "`count_words` method" do
    it "returns the word count for the entry contents as an integer" do
      entry = DiaryEntry.new("Monday", "Lorem ipsum dolor sit amet.")
      expect(entry.count_words).to eq 5
    end
  end

  context "`reading_time` method returns an integer in wpm" do
    it "returns 1 for a wpm value of 200 and contents of 200 words" do
      entry = DiaryEntry.new("Monday", "Lorem " * 200)
      expect(entry.reading_time(200)).to eq 1
    end
    it "returns 1 for a wpm value of 200 and contents of 100 words" do
      entry = DiaryEntry.new("Monday", "Lorem " * 100)
      expect(entry.reading_time(200)).to eq 1
    end
    it "returns 2 for a wpm value of 200 and contents of 400 words" do
      entry = DiaryEntry.new("Monday", "Lorem " * 400)
      expect(entry.reading_time(200)).to eq 2
    end
    it "fails for a reading speed of 0" do
      entry = DiaryEntry.new("Monday", "Lorem " * 400)
      expect { entry.reading_time(0) }.to raise_error "Reading speed must be greater than 0."
    end
  end

  describe "reading_chunk" do
    context "with a contents readable within the given minutes" do
      it "returns the full text" do
        entry = DiaryEntry.new("Monday", "Lorem " * 100)
        expect(entry.reading_chunk(200, 1)).to eq ("Lorem " * 100).strip
      end
    end
    context "with a contents not readable within the given minutes" do
      it "returns the first section of the text when called the first time" do
        entry = DiaryEntry.new("Monday", (("Lorem " * 100) + ("Ipsum " * 100)))
        expect(entry.reading_chunk(100, 1)).to eq ("Lorem " * 100).strip
      end

      it "returns the second section of the text when called the second time, etc." do
        entry = DiaryEntry.new("Monday", (("Lorem " * 200) + ("Ipsum " * 200) + ("Dolor " * 200)))
        expect(entry.reading_chunk(200, 1)).to eq ("Lorem " * 200).strip
        expect(entry.reading_chunk(200, 1)).to eq ("Ipsum " * 200).strip
        expect(entry.reading_chunk(200, 1)).to eq ("Dolor " * 200).strip
      end

      it "restarts when it reaches the end" do
        entry = DiaryEntry.new("Monday", (("Lorem " * 200) + ("Ipsum " * 200)))
        expect(entry.reading_chunk(200, 1)).to eq ("Lorem " * 200).strip
        expect(entry.reading_chunk(200, 1)).to eq ("Ipsum " * 200).strip
        expect(entry.reading_chunk(100, 2)).to eq ("Lorem " * 200).strip
      end
    end
  end
end
