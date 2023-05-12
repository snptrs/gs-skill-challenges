require 'grammar'

RSpec.describe GrammarStats do
  it "initializes" do
    grammar = GrammarStats.new
  end

  context "#check" do
    it "returns true when passed a valid sentence" do
      grammar = GrammarStats.new
      result = grammar.check("Lorem ipsum dolor.")
      expect(result).to eq true
    end

    it "returns false when passed a sentence without punctuation" do
      grammar = GrammarStats.new
      result = grammar.check("Lorem ipsum dolor")
      expect(result).to eq false
    end

    it "returns false when passed a sentence without a capital letter" do
      grammar = GrammarStats.new
      result = grammar.check("lorem ipsum dolor.")
      expect(result).to eq false
    end

    it "returns false when passed a sentence without a capital letter or punctuation" do
      grammar = GrammarStats.new
      result = grammar.check("lorem ipsum dolor")
      expect(result).to eq false
    end
  end
end