# This implementation has a Word class that stores the word, category, language, and added_on date. The WordList class stores a list of words and provides methods to list all words, categories, and languages, as well as a filtered list of words based on category and language.

class Word
  attr_accessor :word, :category, :language, :added_on

  def initialize(word, category, language, added_on)
    @word = word
    @category = category
    @language = language
    @added_on = added_on
  end
end

class WordList
  def initialize
    @words = []
  end

  def add_word(word)
    @words << word
  end

  def list_words(filter_by = {})
    filtered_words = @words
    filtered_words = filtered_words.select { |word| word.added_on == filter_by[:added_on] } if filter_by[:added_on]
    filtered_words = filtered_words.select { |word| word.category == filter_by[:category] } if filter_by[:category]
    filtered_words = filtered_words.select { |word| word.language == filter_by[:language] } if filter_by[:language]

    filtered_words.map(&:word)
  end

  def list_categories
    @words.map(&:category).uniq
  end

  def list_languages
    @words.map(&:language).uniq
  end
end

# Example usage:
word_list = WordList.new
word_list.add_word(Word.new("hello", "greeting", "English", Time.now))
word_list.add_word(Word.new("hola", "greeting", "Spanish", Time.now))
word_list.add_word(Word.new("bonjour", "greeting", "French", Time.now))

puts "Words: #{word_list.list_words}"
puts "Categories: #{word_list.list_categories}"
puts "Languages: #{word_list.list_languages}"

filtered_words = word_list.list_words(category: "greeting", language: "English")
puts "Filtered words: #{filtered_words}"
