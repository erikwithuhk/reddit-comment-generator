require 'pry'

base = %{
The BYU Wikipedia corpus, which was released in early 2015, was created by Mark \
Davies (professor of linguistics at Brigham Young University). It contains 1.9 \
billion words in 4.4 million web pages, and you can search the entire corpus \
with the same type of queries as the other BYU corpora.

More importantly, though, you can also quickly and easily create "virtual" \
corpora "on the fly" for any topic that you want, such as: biology, investments\
, Buddhism, psychology, cars, basketball.
}

reddit = IO.read("./lib/data.csv", 5000)

def count_words(words)
  word_count = {}
  words.map do |word|
    if !word_count.include?(word)
      word_count[word] = 1
    else
      word_count[word] += 1
    end
  end
  word_count
end

def get_words(text)
  words = text.split(" ")
  cleaned_words = words.map { |word| word.gsub(/\W/, '').downcase }
end

def word_frequency(text)
  words = get_words(text)
  word_count = count_words(words)
  word_frequency = {}
  word_count.each do |word, count|
    word_frequency[word] = count.to_f / words.length.to_f
  end
  word_frequency
end

def get_unique_words(new_text, base_text)
  new_text_frequency = word_frequency(new_text)
  base_text_frequency = word_frequency(base_text)

  unique_words = []
  new_text_frequency.each do |key, value|
    if base_text_frequency.include?(key)
      unique_words.push(key)
    end
  end
  unique_words
end

binding.pry
