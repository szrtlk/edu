# Define the class Word with the attributes word, language, category, and date
class Word
  attr_accessor :word, :language, :category, :date
  def initialize(word, language, category, date)
    @word = word
    @language = language
    @category = category
    @date = date
  end
end

# Create an array of words
words = [
  Word.new("hello", "English", "greeting", "2022-01-01"),
  Word.new("bonjour", "French", "greeting", "2022-01-02"),
  Word.new("hola", "Spanish", "greeting", "2022-01-03"),
  Word.new("hi", "English", "greeting", "2022-01-04"),
  Word.new("ciao", "Italian", "greeting", "2022-01-05")
]

# Define a method to filter words by language
def filter_by_language(words, language)
  words.select { |word| word.language == language }
end

# Define a method to filter words by category
def filter_by_category(words, category)
  words.select { |word| word.category == category }
end

# Define a method to filter words by date
def filter_by_date(words, date)
  words.select { |word| word.date == date }
end

# Use the filter methods to print the filtered words
puts "Words filtered by language 'English':"
puts filter_by_language(words, "English").map(&:word)

puts "Words filtered by category 'greeting':"
puts filter_by_category(words, "greeting").map(&:word)

puts "Words filtered by date '2022-01-03':"
puts filter_by_date(words, "2022-01-03").map(&:word)
