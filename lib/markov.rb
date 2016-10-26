require 'byebug'
require './lib/word_calculator'

TEST = "I love bananas. I love apples. So fun to love those things.".freeze
REDDIT_DATA_FILE = "./lib/reddit_comments_raw.csv"

REDDIT_COMMENTS = IO.read(REDDIT_DATA_FILE, 10000 * 10000)

word_calculator = WordCalculator.new(REDDIT_COMMENTS)
total_words = word_calculator.total_words
top_3_words = word_calculator.top_words(3)

words = word_calculator.words

word_pairs = {}
words.each_index do |index|
  first_word = words[index]
  second_word = words[index + 1] || ""
  if !word_pairs.include?(first_word)
    word_pairs[first_word] = [second_word]
  else
    word_pairs[first_word] = word_pairs[first_word].push(second_word)
  end
end

# Select a word at random from top words
initial_word = top_3_words.sample
# For a specified number of words
sentence = "#{initial_word}"
20.times do
  next_word = word_pairs[initial_word].sample
  sentence += " #{next_word}"
  initial_word = next_word
end

puts sentence
# Select a word at random that follows the previous word


# Bonus:
# Write a function which constructs an entire sentence... using your solution to
# step 2. Note: This is essentially building a Markov model.
