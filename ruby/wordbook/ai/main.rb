# This implementation allows you to add languages, words, and categories to the dictionary. You can specify the translations for each word in each language, and you can specify a category and comment for each word. The main loop lets you add new words and categories, or exit the program.

class Language
  attr_accessor :name, :words

  def initialize(name)
    @name = name
    @words = []
  end
end

class Word
  attr_accessor :translations, :category, :comment

  def initialize(translations, category = nil, comment = nil)
    @translations = translations
    @category = category
    @comment = comment
  end
end

class Dictionary
  attr_accessor :languages, :categories

  def initialize
    @languages = []
    @categories = []
  end

  def add_language(language)
    languages << language
  end

  def add_word(word, language_names)
    language_names.each do |language_name|
      language = languages.find { |l| l.name == language_name }
      language.words << word if language
    end
  end

  def add_category(category)
    categories << category
  end
end

# Start the program
puts "Welcome to the dictionary application!"
puts "Please enter your name:"
user_name = gets.chomp

dictionary = Dictionary.new

puts "Hello, #{user_name}! Please enter the languages you would like to add words to (enter 'done' when finished):"
loop do
  language_name = gets.chomp
  break if language_name == 'done'

  dictionary.add_language(Language.new(language_name))
end

puts "Please choose your native language:"
native_language = gets.chomp
dictionary.languages.find { |l| l.name == native_language }.tap do |language|
  language.words << Word.new({ native_language => 'native language' }, 'System')
end

# Main loop
loop do
  puts "What would you like to do? (add word, add category, exit)"
  action = gets.chomp

  case action
  when 'add word'
    translations = {}
    dictionary.languages.each do |language|
      puts "Enter the translation for 'native language' in #{language.name}:"
      translation = gets.chomp
      translations[language.name] = translation
    end

    puts "Enter the word's category (or leave blank for no category):"
    category = gets.chomp

    puts "Enter any comments for this word (or leave blank for no comments):"
    comment = gets.chomp

    dictionary.add_word(Word.new(translations, category, comment), dictionary.languages.map(&:name))

  when 'add category'
    puts "Enter the new category name:"
    category_name = gets.chomp

    dictionary.add_category(category_name)

  when 'exit'
    break
  end
end

puts "Goodbye, #{user_name}!"
