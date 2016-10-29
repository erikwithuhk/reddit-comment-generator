require 'csv'
require './lib/word_calculator'

REDDIT_DATA_FILE = "./lib/reddit_comments_raw.csv"
REDDIT_SEED_FILE = "./lib/reddit_comments_limit_100_000.csv"

word_calculator = WordCalculator.new

CSV.open(REDDIT_SEED_FILE, "wb") do |csv|
  lines = 0
  CSV.foreach(REDDIT_DATA_FILE) do |row|
    if lines > 100_000
      break
    else
      csv << row
      p row[0]
      p lines
      lines += 1
    end
  end
end
