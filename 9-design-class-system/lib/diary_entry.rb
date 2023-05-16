class DiaryEntry
  def initialize(date, entry)
    @date = date
    @entry = entry 
  end

  def entry_date
    @date
  end

  def entry
    @entry
  end

  def count_words
    @entry.split(" ").length
  end

  def reading_time(wpm)
    (count_words / wpm.to_f).ceil
  end

end