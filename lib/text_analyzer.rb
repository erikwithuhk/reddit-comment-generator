require 'byebug'
require './lib/frequency_calculator'

class TextAnalyzer

  def initialize(new_text, base_text)
    @new_text = new_text
    @base_text = base_text
    @frequency_calculator = FrequencyCalculator.new
  end

  def get_unique_words
    new_text_frequency = @frequency_calculator.get_word_frequency(@new_text)
    new_text_top_1000 = get_top_words(new_text_frequency, 500)

    unique_words = []
    new_text_top_1000.each do |key, value|
      if !@base_text.include?(key)
        unique_words.push(key)
      end
    end
    unique_words
  end

  def get_top_words(word_frequency, limit)
    sorted_frequency = word_frequency.sort_by { |key, value| value }
    descending_frequency = sorted_frequency.reverse
    debugger
    descending_frequency[0...limit]
  end

end
