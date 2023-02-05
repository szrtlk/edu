class Word
  attr_accessor :text, :category, :language, :added_at

  def initialize(text, category, language, added_at)
    @text = text
    @category = category
    @language = language
    @added_at = added_at
  end
end

class Dictionary
  attr_accessor :words

  def initialize
    @words = []
  end

  def add_word(word)
    @words << word
  end

  def print_words(filter = {})
    filtered_words = @words
    filtered_words = filtered_words.select { |word| word.category == filter[:category] } if filter[:category]
    filtered_words = filtered_words.select { |word| word.language == filter[:language] } if filter[:language]
    filtered_words = filtered_words.select { |word| word.added_at >= filter[:added_after] } if filter[:added_after]
    filtered_words = filtered_words.select { |word| word.added_at <= filter[:added_before] } if filter[:added_before]

    filtered_words.each do |word|
      puts "Word: #{word.text}, Category: #{word.category}, Language: #{word.language}, Added At: #{word.added_at}"
    end
  end

  def print_categories
    categories = @words.map(&:category).uniq
    puts "Categories: #{categories.join(', ')}"
  end

  def print_languages
    languages = @words.map(&:language).uniq
    puts "Languages: #{languages.join(', ')}"
  end
end

# Example usage
dictionary = Dictionary.new

word1 = Word.new("Hello", "Greeting", "English", Time.new(2021, 01, 01))
word2 = Word.new("Bonjour", "Greeting", "French", Time.new(2021, 02, 01))
word3 = Word.new("Hola", "Greeting", "Spanish", Time.new(2021, 03, 01))

dictionary.add_word(word1)
dictionary.add_word(word2)
dictionary.add_word(word3)

dictionary.print_words

# Output:
# Word: Hello, Category: Greeting, Language: English, Added At: 2021-01-01 00:00:00 +0000
# Word: Bonjour, Category: Greeting, Language: French, Added At: 2021-02-01 00:00:00 +0000
# Word: Hola, Category: Greeting, Language: Spanish, Added At: 2021-03-01 00:00:00 +0000

dictionary.print_categories

# Output:
# Categories: Greeting

dictionary.print_languages

# Output:
# Languages: English, French, Spanish

# With filter
dictionary.print_words(category: "Greeting", added_after: Time.new(2021, 02, 01))

# Output:
# Word: Bonjour, Category:
