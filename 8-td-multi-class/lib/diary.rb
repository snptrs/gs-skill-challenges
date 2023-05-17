class Diary
  def initialize
    @diary = []
  end

  def add(entry) # entry is an instance of DiaryEntry
    @diary << entry
  end

  def all
    @diary
  end

  def count_words
    total = 0
    @diary.each do |entry|
      total += entry.count_words
    end
    return total
  end

  def reading_time(wpm)
    fail "Error: wpm should be a non-negative integer" if wpm < 0
    (count_words / wpm.to_f).ceil
  end

  def find_best_entry_for_reading_time(wpm, minutes)
    readable_entries = @diary.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end

    return readable_entries.max_by { |entry| entry.count_words } if readable_entries.any?

  end
end