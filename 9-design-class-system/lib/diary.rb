class Diary
  def initialize
    @entries = []
  end

  def add_entry(entry)
    @entries << entry
  end

  def read_entries
    @entries
  end

  def read_entry_of_length(wpm, minutes)
    readable_entries = @entries.filter do |entry|
      entry.reading_time(wpm) <= minutes
    end

    return readable_entries.max_by { |entry| 
      entry.count_words 
    } if readable_entries.any?
  end
end