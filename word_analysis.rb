class WordAnalysis

  def initialize(phrase)
    @phrase = phrase
    @word_frequency_hash = {}
    @phrase_array = @phrase.downcase.split("").delete_if{|x| x =~ /[^\w\s]/}.join("").split(" ")
    @letter_array = @phrase.downcase.split("").delete_if{|x| x =~ /[^\w\s]/}
    @symbol_array = @phrase.downcase.split("").delete_if{|x| x =~ /[\w\s]/}
  end

  def word_tracker
    @phrase_array.each do |word|
      if @word_frequency_hash.keys.include?(word)
        @word_frequency_hash[word] += 1
      else
        @word_frequency_hash[word] = 1
      end
    end
    @word_frequency_hash
  end

  def letter_tracker
    @letter_frequency_hash = {}
    @letter_array.each do |letter|
      if @letter_frequency_hash.keys.include?(letter)
        @letter_frequency_hash[letter] += 1
      else
        @letter_frequency_hash[letter] = 1
      end
    end
    @letter_frequency_hash.delete(" ")
    @letter_frequency_hash
  end

  def symbol_tracker
    frequency_hash = {}
    @symbol_array.each do |symbol|
      if frequency_hash.keys.include?(symbol)
        frequency_hash[symbol] += 1
      else
        frequency_hash[symbol] = 1
      end
    end
    frequency_hash
  end

  def top_words
    word_tracker
    @word_frequency_hash.sort_by{|k,v| v }.reverse.first(3)
  end

  def top_letters
    letter_tracker
    @letter_frequency_hash.sort_by{|k,v| v}.reverse.first(3)
  end

  def single_words
    word_tracker
    singles = []
    @word_frequency_hash.each do |key, value|
      if value == 1
        singles << key
      end
    end
    singles
  end

  def unused_letters
    alphabet = ('a'..'z').to_a
    letter_tracker
    @letter_frequency_hash.each do |key, value|
      alphabet.delete(key)
    end
    alphabet
  end

end