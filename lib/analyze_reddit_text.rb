require './lib/english_words'
require './lib/text_analyzer'

# base = %{
#   The BYU Wikipedia corpus, which was released in early 2015, was created by Mark \
#   Davies (professor of linguistics at Brigham Young University). It contains 1.9 \
#   billion words in 4.4 million web pages, and you can search the entire corpus \
#   with the same type of queries as the other BYU corpora.
#
#   More importantly, though, you can also quickly and easily create "virtual" \
#   corpora "on the fly" for any topic that you want, such as: biology, investments\
#   , Buddhism, psychology, cars, basketball.
# }
base = EnglishWords::TOP_WORDS
reddit = IO.read("./lib/data.csv", 1000 * 100000)

text_analyzer = TextAnalyzer.new(reddit, base)
# text_analyzer = TextAnalyzer.new(base, reddit)
puts text_analyzer.get_unique_words
