require './lib/frequency_calculator'

class TextAnalyzer

  def initialize(new_text, base_text)
    @new_text = new_text
    @base_text = base_text
    @frequency_calculator = FrequencyCalculator.new
  end

  def get_unique_words
    new_text_frequency = @frequency_calculator.get_word_frequency(@new_text)
    base_text_frequency = @frequency_calculator.get_word_frequency(@base_text)

    top_1000_words_frequency = get_top_words(new_text_frequency, 1)

    # unique_words = []
    # new_text_frequency.each do |key, value|
    #   if !base_text_frequency.include?(key)
    #     unique_words.push(key)
    #   end
    # end
    # unique_words
  end

  def get_top_words(word_frequency, limit)
    sorted_frequency = word_frequency.sort_by { |key, value| value }
    descending_frequency = sorted_frequency.reverse
    descending_frequency[0...limit]
  end

end
