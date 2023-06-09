# {{PROBLEM}} Class Design Recipe

## 1. Describe the Problem

As a user
So that I can keep track of my music listening
I want to add tracks I've listened to and see a list of them.

## 2. Design the Class Interface

_Include the initializer and public methods with all parameters and return values._

```ruby
# EXAMPLE

class Music
  def initialize
    # ...
  end

  def add(track) # track is a string
    # Doesn't return anything
  end

  def list
    # Returns a list of stored tracks as strings
  end
end
```

## 3. Create Examples as Tests

_Make a list of examples of how the class will behave in different situations._

```ruby
# EXAMPLE

# 1
music = Music.new
music.add("Yellow Submarine")
music.list # => ["Yellow Submarine"]

# 2
music = Music.new
music.add("Yellow Submarine")
music.add("Help!")
music.list # => ["Yellow Submarine", "Help!"]

# 3
music = Music.new
music.add("") # Throws an error if empty track name passed

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._