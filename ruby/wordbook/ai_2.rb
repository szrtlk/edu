# This program creates classes for Language, Word, and Dictionary. The Dictionary class has methods for adding languages, categories, and words, as well as filtering the words based on language, category, and date range. The Language class has an array of words, and the Word class has attributes for the term, category, comment, and date added.

class Language
  attr_accessor :name, :words

  def initialize(name)
    @name = name
    @words = []
  end
end

class Word
  attr_accessor :term, :category, :comment, :date_added

  def initialize(term, category, comment, date_added)
    @term = term
    @category = category
    @comment = comment
    @date_added = date_added
  end
end

class Dictionary
  attr_accessor :languages, :categories

  def initialize
    @languages = []
    @categories = []
  end

  def add_language(language)
    @languages << language
  end

  def add_category(category)
    @categories << category
  end

  def add_word(language, term, category = nil, comment = nil)
    word = Word.new(term, category, comment, Time.now)
    language.words << word
  end

  def filter_words(language, category = nil, date_range = nil)
    filtered_words = language.words.select do |word|
      word.category == category || category.nil?
    end

    if date_range
      filtered_words.select! do |word|
        word.date_added >= date_range.first && word.date_added <= date_range.last
      end
    end

    filtered_words
  end
end

# Example usage:
dictionary = Dictionary.new

spanish = Language.new("Spanish")
dictionary.add_language(spanish)

english = Language.new("English")
dictionary.add_language(english)

dictionary.add_category("Verbs")
dictionary.add_category("Nouns")

dictionary.add_word(spanish, "Hola", "Greeting")
dictionary.add_word(english, "Hello", "Greeting")

words = dictionary.filter_words(spanish, "Greeting")
puts words.map(&:term)
