require 'rspec'
require_relative 'word_analysis.rb'

describe WordAnalysis do 

  it 'word_tracker returns the frequency of each word' do
    expect(WordAnalysis.new('Toy boat toy boat toy boat').word_tracker).to eql({"toy" => 3, "boat" => 3})
  end

  it 'word_tracker returns a hash' do
    expect(WordAnalysis.new('This that and the other and also some other stuff').word_tracker).to be_an_instance_of(Hash)
  end

  it 'word_tracker counts letters regardless of capitalization' do
    expect(WordAnalysis.new('Toy Boat tOy bOat toY boAt').word_tracker).to eql({"toy" => 3, "boat" => 3})
  end

  it "word_tracker doesn't count punctuation" do
    expect(WordAnalysis.new('Toy boat? Toy boat! Toy boat?!?!').word_tracker).to eql({"toy" => 3, "boat" => 3})
  end

  it 'letter_tracker returns the frequency of each letter' do
    expect(WordAnalysis.new('Toy boat toy boat toy boat').letter_tracker).to eql({"t"=>6, "o"=>6, "y"=>3, "b"=>3, "a"=>3})
  end

  it 'symbol_tracker returns the frequency of each symbol, not counting whitespace' do
    expect(WordAnalysis.new('Toy boat? Toy boat! Toy boat?!?!').symbol_tracker).to eql({"?"=>3, "!"=>3})
  end

  it 'top_words returns an array of the top 3 words in the phrase' do
    expect(WordAnalysis.new("This that and the other, this that as well as another, this that that the and").top_words).to be_an_instance_of(Array)
    expect(WordAnalysis.new("This that and the other, this that as well as another, this that that the and").top_words).to eql([["that", 4], ["this", 3], ["as", 2]])
  end

  it 'single_words returns an array of the words used only once in the phrase' do
    expect(WordAnalysis.new("This that and the other, this that as well as another, this that that the and").single_words).to be_an_instance_of(Array)
    expect(WordAnalysis.new("This that and the other, this that as well as another, this that that the and").single_words).to eql(["other", "well", "another"])
  end

  it 'unused_letters returns an array of the letters in the alphabet not used in the phrase' do
    expect(WordAnalysis.new("abcdefghijklpqrstuvwxyz").unused_letters).to be_an_instance_of(Array)
    expect(WordAnalysis.new("abcdefghijklpqrstuvwxyz").unused_letters).to eql(["m", "n", "o"])
  end
end