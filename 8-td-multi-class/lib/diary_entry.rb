class DiaryEntry
  def initialize(title, contents) # title, contents are strings
    @title = title
    @contents = contents
    @start = 0
  end

  def title
    @title
  end

  def contents
    @contents
  end

  def count_words
    @contents.split(" ").length
  end


  def reading_time(wpm)
    fail "Error: wpm should be a non-negative integer" if wpm < 0
    (count_words / wpm.to_f).ceil
  end
    

  def reading_chunk(wpm, minutes) 
    fail "Error. Parameter should be above 0!" unless wpm.positive? && minutes.positive?
    finish = wpm * minutes
    chunk = @contents.split(" ").slice(@start, finish).join(" ")
    if @start + finish >= count_words
      @start = 0
    else
      @start += finish
    end
    return chunk
    # ...
  end
end
