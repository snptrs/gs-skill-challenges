# Grammar Method Design Recipe

## 1. Describe the Problem

As a user
So that I can improve my grammar
I want to verify that a text starts with a capital letter and ends with a suitable sentence-ending punctuation mark.

## 2. Design the Method Signature

_Include the name of the method, its parameters, return value, and side effects._

```ruby
# EXAMPLE

# `check_grammar` validates whether a string is grammatically correct
result = check_grammar(text)

text: a string (e.g. "This is a valid sentence.")
result: a string (e.g. ["Sentence is correct."])

# The method prints confirmation of whether the sentence is valid.
```

## 3. Create Examples as Tests

```ruby
# EXAMPLE

check_grammar("Lorem ipsum dolor sit amet.") => ["Sentence is correct."]
check_grammar("lorem ipsum dolor sit amet.") => ["Sentence is not correct."]
check_grammar("Lorem ipsum dolor sit amet") => ["Sentence is not correct."]
check_grammar("lorem ipsum dolor sit amet") => ["Sentence is not correct."]
check_grammar("") => ["No text provided."]
```

## 4. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green, refactor to implement the behaviour._