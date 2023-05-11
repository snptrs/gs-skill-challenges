def check_grammar(text)
  return "No text provided." if text == ""
  valid = /^[A-Z].*[.!?]$/ =~ text

  case valid
  when 0
    return "Sentence is correct."
  when nil
    return "Sentence is not correct."
  end
end
