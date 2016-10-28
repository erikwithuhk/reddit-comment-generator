require 'byebug'

class Sentence
  def initialize(length)
    @sentence = generate_sentence(length)
  end

  def generate_sentence(limit)
    sentence = ""
    total_words = Word.count
    top_50_words = Word.order(count: :desc).limit(50)
    current_word = top_50_words.sample
    first_word = current_word.word.capitalize
    sentence += first_word
    limit.times do
      next_word = eval(current_word.next_words).sample
      sentence += " #{next_word}"
      if Word.find_by word: next_word
        current_word = Word.find_by word: [next_word]
      else
        current_word = top_50_words.sample
      end
    end
    sentence += "."
  end
end
