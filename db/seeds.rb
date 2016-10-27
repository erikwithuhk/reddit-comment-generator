require './lib/word_calculator'

TEST = "./lib/test.txt"
REDDIT_DATA_FILE = "./lib/reddit_comments_raw.csv"

REDDIT_COMMENTS = IO.read(TEST)

word_calculator = WordCalculator.new(REDDIT_COMMENTS)

markov_data = word_calculator.markov_data


markov_data.each do |word, data|
  # puts "Word: #{word}, Frequency: #{data[:frequency]}, Next words: #{data[:next_words]}"
  Word.create(word: word, frequency: data[:frequency], next_words: data[:next_words])
end
