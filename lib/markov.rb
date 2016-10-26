require 'byebug'
require './lib/word_calculator'

# Step 1:
# Given a text file including a entire book, find:
# - most frequently used words
# - how many different words there are
#
# Given this information, log a sentence stating:
# "The top three frequent words used in [filename] out of [number] different
# words are [word1], [word2], [word3]."

Reddit_Data_file = "./lib/reddit_comments_raw.csv"

Reddit_Comments = IO.read(Reddit_Data_file, 1000 * 1000)

word_calculator = WordCalculator.new(Reddit_Comments)
total_words = word_calculator.total_words
top_3_words = word_calculator.top_words(3)
puts "The top three frequent words used in #{Reddit_Data_file} out of " \
     "#{total_words} different words are #{top_3_words[0]}, " \
     "#{top_3_words[1]}, #{top_3_words[2]}."

# Step 2:
# Given a word, find all the "next word options". By "next word options" we mean
# an array of all the words that follow the input word in the text. For example,
# if the text read "I love bananas. I love apples. So fun to love those things."
# and I asked to find the "next word options" for the word "love"... the return
# should be [ "bananas", "apples", "those" ] as those words follow the word
# "love" in the text.

# Bonus:
# Write a function which constructs an entire sentence... using your solution to
# step 2. Note: This is essentially building a Markov model.
