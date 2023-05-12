class DiaryEntry
  def initialize(title, contents) #title, contents are strings
    @title = title
    @contents = contents
    @next_chunk_start = 0
  end

  def title
    return @title
  end

  def contents
    return @contents
  end

  def count_words
    return words.count
  end

  def reading_time(wpm)
    fail "Reading speed must be greater than 0." unless wpm > 0
    return (count_words / wpm.to_f).ceil
  end

  def reading_chunk(wpm, minutes)
    fail "Reading speed must be greater than 0." unless wpm > 0
    words_we_can_read = wpm * minutes
    @next_chunk_start = 0 if @next_chunk_start >= words.length
    chunk = words[@next_chunk_start, words_we_can_read].join(" ").strip
    @next_chunk_start += words_we_can_read
    return chunk
  end

  private

  def words
    @contents.split(" ")
  end

end