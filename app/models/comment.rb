class Comment
  attr_reader :text

  def initialize
    @text = create_comment
  end

  private

  def choose_words(length)
    top50words = Word.order(count: :desc).limit(50)
    find_words(top50words, length)
  end

  def create_comment
    number_of_sentences = rand 3..10
    create_sentences(number_of_sentences)
  end

  def create_sentences(number_of_sentences)
    sentences = []
    number_of_sentences.times do
      number_of_words = rand 5..15
      sentences.push(choose_words(number_of_words))
    end
    sentences.join(" ")
  end

  def find_words(top_words, length)
    current_word = top_words.sample
    comment_text = current_word.word.capitalize
    length.times do
      next_word = eval(current_word.next_words).sample
      comment_text += " #{next_word}"
      current_word = set_current_word(next_word, top_words)
    end
    comment_text += "."
  end

  def set_current_word(next_word, top_words)
    if Word.find_by word: next_word
      Word.find_by word: [next_word]
    else
      top_words.sample
    end
  end
end
