require 'byebug'

class FrequencyCalculator

  def initialize
  end

  def get_word_frequency(text)
    words = get_words(text)
    word_count = count_words(words)
    word_frequency = {}
    word_count.each do |word, count|
      word_frequency[word] = count.to_f / words.length.to_f
    end
    word_frequency
  end

  private

  def count_words(words)
    word_count = {}
    words.map do |word|
      if !word_count.include?(word)
        word_count[word] = 1
      else
        word_count[word] += 1
      end
    end
    word_count
  end

  def get_words(text)
    words = text.split(" ")
    cleaned_words = words.map { |word| word.gsub(/\W/, '').downcase }
  end


end
