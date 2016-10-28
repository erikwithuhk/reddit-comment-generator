require 'csv'
require './lib/word_calculator'

REDDIT_DATA_FILE = "./lib/reddit_comments_raw.csv"

word_calculator = WordCalculator.new

lines = 0
CSV.foreach(REDDIT_DATA_FILE) do |row|
  if lines > 100_000
    break
  else
    word_calculator.analyze_line(row[0])
    p lines
    lines += 1
  end
end

word_calculator.words.each do |word, data|
  p word
  Word.create(word: word, count: data[:count], next_words: data[:next_words])
end
