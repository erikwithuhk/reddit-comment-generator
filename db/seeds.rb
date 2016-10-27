require 'csv'
require './lib/word_calculator'

TEST = "./lib/test.csv"
REDDIT_DATA_FILE = "./lib/reddit_comments_raw.csv"
#
# REDDIT_COMMENTS = IO.read(REDDIT_DATA_FILE, 10000)
#
word_calculator = WordCalculator.new
#
# markov_data = word_calculator.markov_data

# markov_data.each do |word, data|
# end
#
#

row_count = 0
CSV.foreach(REDDIT_DATA_FILE) do |row|
  if row_count > 6
    break
  else
    word_calculator.analyze_line(row[0])
    row_count += 1
  end
end

word_calculator.words.each do |word, data|
  puts "Word: #{word}, Count: #{data[:count]}, Next Words: #{data[:next_words]}"
  # Word.create(word: word, frequency: data[:frequency], next_words: data[:next_words])
end
