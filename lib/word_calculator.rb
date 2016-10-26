class WordCalculator
  attr_reader :total_words

  def initialize(text)
    @words = get_words(text)
    @total_words = count_words
  end

  def top_words(limit)
    word_frequencies = calculate_word_frequencies
    sorted_word_frequencies = sort_by_frequency(word_frequencies)
    top_frequencies = sorted_word_frequencies[0...limit]
    combined_frequencies = top_frequencies.reduce(top_frequencies[0], :merge)
    combined_frequencies.keys
  end

  private

  def calculate_word_frequencies
    word_instances = total_word_instances
    word_frequencies = {}
    word_instances.each do |word, instances|
      word_frequencies[word] = instances.to_f / @total_words
    end
    word_frequencies
  end

  def count_words
    @words.length
  end

  def get_words(text)
    text.split(" ")
  end

  def sort_by_frequency(word_frequencies)
    sorted_frequencies = word_frequencies.sort_by { |_key, value| value }
    descending_frequencies = sorted_frequencies.reverse
    descending_frequencies.map { |pair| Hash[*pair] }
  end

  def total_word_instances
    word_instances = {}
    @words.map do |word|
      if !word_instances.include?(word)
        word_instances[word] = 1
      else
        word_instances[word] += 1
      end
    end
    word_instances
  end
end
