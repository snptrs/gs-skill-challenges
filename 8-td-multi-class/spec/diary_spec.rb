require 'diary'

RSpec.describe Diary do
  context "initialy" do
    it "should return an empty array" do
      diary = Diary.new
      expect(diary.all).to eq []
    end
  end
end