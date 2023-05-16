# Diary Multi-Class Planned Design Recipe

## 1. Describe the Problem

As a user
So that I can record my experiences
I want to keep a regular diary

As a user
So that I can reflect on my experiences
I want to read my past diary entries

As a user
So that I can reflect on my experiences in my busy day
I want to select diary entries to read based on how much time I have and my reading speed

As a user
So that I can keep track of my tasks
I want to keep a todo list along with my diary

As a user
So that I can keep track of my contacts
I want to see a list of all of the mobile phone numbers in all my diary entries

## 2. Design the Class System

```

         ┌───────────────────────────────────────┐
         │ Diary                                 │
         │                                       │
         │ - add(entry)                          │
         │ - read_all                            │
         │ - reading_time_entry(wpm, minutes)    │
         │ - add_task                            │
         │ - view_tasks                          │
         │ - complete_task                       │
         │ - view_contacts                       │
         │                                       │
         │                                       │
         │                                       │
         │                                       │
         └──────────┬─────────────────┬──────────┘
                    │                 │            
        Maintains a │                 │ Maintains  
        list of     │                 │ a list of  
                    │                 │            
        ┌───────────▼────┐    ┌───────▼───────┐    
        │ DiaryEntry     │    │ Task          │    
        │                │    │               │    
        │ - date         │    │ - description │    
        │ - entry        │    │ - status      │    
        │ - length       │    │               │    
        │                │    │               │    
        │                │    │               │    
        └────────────────┘    └───────────────┘    

```

_Also design the interface of each class in more detail._

```ruby
class Diary
  def initialize
  end

  def add_entry(entry) # track is an instance of Track
    # Entry gets added to the diary
    # Returns nothing
  end

  def read_entries
    # Returns a list of diary entries
  end

  def read_entry_of_length(wpm, mintutes)
  end

  def add_task(task)
  end

  def view_tasks
  end

  def complete_task(task)
  end

  def view_contacts
  end

  end
end

class DiaryEntry
  def initialize(date, entry) # date and entry are strings
  end

  def entry_date
    # Returns the entry date as a string
  end

  def entry
    # Returns the entry as a string
  end

  def count_words
    # Returns the entry length as an integer
  end

  def reading_time(wpm, minutes)
    # Returns an integer for minutes needed to read the entry
  end
end

class Task
  def initialize(task)
  end

  def description
  end

  def status
  end

  def done
  end
end


```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

# Adds and gets multiple diary entries
diary = Diary.new
diary_entry_1 = DiaryEntry.new("5 January", "First diary entry")
diary_entry_2 = DiaryEntry.new("13 February", "Second diary entry")
diary.add_entry(diary_entry_1)
diary.add_entry(diary_entry_2)
diary.read_entries # => ["First diary entry", "Second diary entry"]

# Returns a diary entry that can be read in the given time
diary = Diary.new
diary_entry_1 = DiaryEntry.new("5 January", "Diary entry of five words")
diary_entry_2 = DiaryEntry.new("13 February", "Three word entry")
diary.add_entry(diary_entry_1)
diary.add_entry(diary_entry_2)
diary.read_entry_of_length(1, 5) # => "Diary entry of five words"

# Adds and gets tasks
diary = Diary.new
task_1 = Task.new("Buy bread")
diary.add_task(task_1)
diary.view_tasks # => ["Buy bread"]

# Completes tasks
diary = Diary.new
task_1 = Task.new("Buy bread")
diary.add_task(task_1)
diary.complete_task(task_1) # => task_1.status == "complete"

# Searches diary entries for phone numbers
diary = Diary.new
diary_entry_1 = DiaryEntry.new("5 January", "I met Josh today: 07123 456789")
diary_entry_2 = DiaryEntry.new("13 February", "Three word entry")
diary_entry_2 = DiaryEntry.new("13 February", "Remember Mollie's number: 07000555666")
diary.add_entry(diary_entry_1)
diary.add_entry(diary_entry_2)
diary.add_entry(diary_entry_2)
diary.view_contacts # => ["07123 456789", "07000555666"]

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# Returns reading time for a diary entry
diary = Diary.new
diary_entry_1 = DiaryEntry.new("5 January", "First diary entry")
diary_entry_1.reading_time(1) #=> 3

# Marks a task complete
task = Task.new("Buy bread")
task.done # => task.status == "complete"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._