require 'letter_counter'

RSpec.describe LetterCounter do
  context "when given a string" do
    it "returns the most frequent letter" do
      counter = LetterCounter.new("Digital Punk")
      expect(counter.calculate_most_common).to eq [2, "i"]
    end
  end
end