require 'csv'
require './lib/word_calculator'

REDDIT_DATA_FILE = "./lib/reddit_comments_raw.csv"

word_calculator = WordCalculator.new

row_count = 0
CSV.foreach(REDDIT_DATA_FILE) do |row|
  if row_count > 100
    break
  else
    word_calculator.analyze_line(row[0])
    row_count += 1
  end
end

word_calculator.words.each do |word, data|
  Word.create(word: word, count: data[:count], next_words: data[:next_words])
end
