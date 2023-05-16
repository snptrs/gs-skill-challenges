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
end