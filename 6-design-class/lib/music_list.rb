class Music
  def initialize
    @track_list = []
  end

  def add(track)
    fail "No track name" if track == ""
    @track_list.push(track)
  end

  def list
    return @track_list
  end
end