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
  end
end