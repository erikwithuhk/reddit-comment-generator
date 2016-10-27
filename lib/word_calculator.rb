class WordCalculator
  attr_reader :words

  def initialize
    @words = {}
  end

  def analyze_line(line)
    words = line.split(" ")
    add_words(words)
  end

  private

  def add_words(words)
    words.each_index do |index|
      first_word = clean_word(words[index])
      second_word = words[index + 1] ? clean_word(words[index + 1]) : ""
      if first_word == ""
        next
      else
        if !@words.include?(first_word)
            @words[first_word] = { count: 1, next_words: [second_word] }
        else
          @words[first_word][:count] += 1
          @words[first_word][:next_words].push(second_word)
        end
      end
    end
  end

  def clean_word(word)
    word.gsub(/\W/, '')
  end
end
