# The code could be improved by:

    # Following naming conventions: class names should be in CamelCase, method names and variable names should be in snake_case.

    # Extracting common functionality into a module and including that module in both the Languages and Categories classes, rather than duplicating code.

    # Adding validation to check if the input is valid before adding it to the respective arrays.

    # Adding a method to retrieve an element from the arrays, rather than accessing them directly.

    # Implementing error handling for situations where a user tries to delete an element from an empty array.

    # Adding a method to display all the elements in the arrays, rather than accessing them directly.

    # Storing the date and other attributes of Words in a separate data structure, rather than an instance variable.

# Here is an example of what the code could look like after these changes:

module LanguageArray
  attr_accessor :languages

  def initialize
    @languages = []
  end

  def add_language(language)
    return unless valid_language?(language)

    @languages << language
  end

  def delete_last_language
    return unless languages.any?

    @languages.pop
  end

  def display_languages
    puts "Languages: #{languages}"
  end

  def valid_language?(language)
    # code to validate the language goes here
  end
end

class Languages
  include LanguageArray
end

class Categories
  include LanguageArray
end

class Word
  attr_reader :date, :language, :category, :word

  def initialize(date:, language:, category:, word:)
    @date = date
    @language = language
    @category = category
    @word = word
  end
end

class Words
  attr_accessor :words

  def initialize
    @words = []
  end

  def add_word(word)
    @words << word
  end

  def delete_last_word
    return unless words.any?

    @words.pop
  end

  def display_words
    puts "Words: #{words}"
  end
end

# sample usage

languages = Languages.new
languages.add_language('english')
languages.add_language('czech')

categories = Categories.new
categories.add_language('food')
categories.add_language('clothes')

words = Words.new
words.add_word(Word.new(date: Time.now, language: 'english', category: 'food', word: 'bread'))
words.add_word(Word.new(date: Time.now, language: 'english', category: 'clothes', word: 'shirt'))

languages.display_languages
categories.display_languages
words.display_words
