class Diary
  def initialize
    @entries = []
    @tasks = []
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

    readable_entries.max_by { |entry| 
      entry.count_words 
    } if readable_entries.any?
  end

  def add_task(task)
    @tasks << task
  end

  def view_tasks
    tasks = @tasks.filter { |task| task.status == "incomplete" }
    tasks.map! { |task| task.description}
  end

  def complete_task(task)
    task.done
  end

  def view_contacts
    contacts = []
    @entries.each do |entry|
      /[0-9]{11}/ =~ entry.entry
      contacts << $~[0] if $~ != nil
    end
    return contacts
  end

end