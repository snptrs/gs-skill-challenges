require 'music_list'

RSpec.describe Music do
  context "when given a track name" do
    it "stores the track" do
      music = Music.new
      music.add("Yellow Submarine")
      expect(music.list).to eq ["Yellow Submarine"]
    end
  end

  context "when given multiple tracks" do
    it "stores the tracks" do
      music = Music.new
      music.add("Yellow Submarine")
      music.add("Help!")
      expect(music.list).to eq ["Yellow Submarine", "Help!"]
    end
  end

  context "when passed an empty track name" do
    it "throws an error" do
      music = Music.new
      expect { music.add("") }.to raise_error "No track name"
    end
  end
end