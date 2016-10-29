require 'csv'
require './lib/word_calculator'

REDDIT_SEED_FILE = "./lib/reddit_comments_limit_100_000.csv"

word_calculator = WordCalculator.new

lines = 0
CSV.foreach(REDDIT_SEED_FILE) do |row|
  word_calculator.analyze_line(row[0])
  p row[0]
  lines += 1
end

word_calculator.words.each do |word, data|
  p word
  Word.create(word: word, count: data[:count], next_words: data[:next_words])
end
