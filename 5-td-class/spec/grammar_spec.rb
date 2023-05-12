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

  context "#percentage_good" do
    # catch error if no checks performed yet
    # expect { entry.reading_time(0) }.to raise_error "Reading speed must be greater than 0."

    it "returns an error if no checks done yet" do
      grammar = GrammarStats.new
      expect { grammar.percentage_good }.to raise_error "No checks performed yet."
    end

    it "returns 100 when passed one valid sentence" do
      grammar = GrammarStats.new
      grammar.check("Lorem ipsum dolor.")
      result = grammar.percentage_good
      expect(result).to eq 100
    end

    it "returns 50 when passed one valid and one invalid sentence" do
      grammar = GrammarStats.new
      grammar.check("Lorem ipsum dolor.")
      grammar.check("lorem ipsum dolor.")
      result = grammar.percentage_good
      expect(result).to eq 50
    end

    it "returns 0 when passed two invalid sentences" do
      grammar = GrammarStats.new
      grammar.check("lorem ipsum dolor")
      grammar.check("lorem ipsum dolor.")
      result = grammar.percentage_good
      expect(result).to eq 0
    end
  end
end
