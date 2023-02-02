# This code defines classes for Language, Word, and Person. A Person can have multiple Languages and can add Words to the current language. The Word class has a value, category, and an array of comments. The view_words method displays the words in the current language.

class Language
  attr_reader :name, :words

  def initialize(name)
    @name = name
    @words = []
  end

  def add_word(word)
    @words << word
  end
end

class Word
  attr_reader :value, :category, :comments

  def initialize(value, category, comments = [])
    @value = value
    @category = category
    @comments = comments
  end
end

class Person
  attr_reader :languages, :current_language

  def initialize
    @languages = []
    @current_language = nil
  end

  def add_language(language)
    @languages << language
  end

  def set_current_language(language)
    @current_language = language
  end

  def add_word(value, category, comments = [])
    if @current_language
      word = Word.new(value, category, comments)
      @current_language.add_word(word)
    else
      puts "Please set a current language first."
    end
  end

  def view_words
    if @current_language
      @current_language.words.each do |word|
        puts "Value: #{word.value}"
        puts "Category: #{word.category}"
        puts "Comments: #{word.comments.join(", ")}"
        puts
      end
    else
      puts "Please set a current language first."
    end
  end
end

person = Person.new
language1 = Language.new("English")
language2 = Language.new("Russian")
person.add_language(language1)
person.add_language(language2)

person.set_current_language(language1)
person.add_word("hello", "greeting", ["informal"])
person.add_word("world", "noun")

person.set_current_language(language2)
person.add_word("привет", "приветствие", ["неформальное"])
person.add_word("мир", "существительное")

person.set_current_language(language1)
person.view_words

person.set_current_language(language2)
person.view_words
