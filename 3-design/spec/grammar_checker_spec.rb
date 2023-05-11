require 'grammar_checker'

RSpec.describe "grammar checker" do
  context "when passed a string" do
    it "confirms that the string is valid" do
      expect(check_grammar("Lorem ipsum dolor sit amet.")).to eq "Sentence is correct."
    end

    it "reports an invalid sentence if it doesn't beging with a capital" do
      expect(check_grammar("lorem ipsum dolor sit amet.")).to eq "Sentence is not correct."
    end

    it "reports an invalid sentence if it doesn't end with correct punctuation" do
      expect(check_grammar("Lorem ipsum dolor sit amet")).to eq "Sentence is not correct."
    end

    it "reports an invalid sentence if it doesn't start with a capital or end with correct punctuation" do
      expect(check_grammar("lorem ipsum dolor sit amet")).to eq "Sentence is not correct."
    end

    it "returns if no text provided" do
      expect(check_grammar("")).to eq "No text provided."
    end
  end
end