class Word
  attr_accessor :text, :language, :category, :date_added
  
  def initialize(text, language, category, date_added)
    @text = text
    @language = language
    @category = category
    @date_added = date_added
  end
end

def menu
  puts "1. Show all words"
  puts "2. Add a new word"
  puts "3. Filter words by date"
  puts "4. Filter words by category"
  puts "5. Filter words by language"
  puts "6. Exit"
end

def get_input
  gets.chomp
end

def show_all_words(words)
  words.each do |word|
    puts "Text: #{word.text}"
    puts "Language: #{word.language}"
    puts "Category: #{word.category}"
    puts "Date Added: #{word.date_added}"
    puts "-----------------"
  end
end

def add_new_word(words)
  puts "Enter the text of the word:"
  text = get_input
  puts "Enter the language of the word:"
  language = get_input
  puts "Enter the category of the word:"
  category = get_input
  date_added = Time.now.strftime("%Y-%m-%d")

  words << Word.new(text, language, category, date_added)
  puts "Word added successfully!"
end

def filter_words_by_date(words)
  puts "Enter the date to filter by (YYYY-MM-DD):"
  date = get_input
  filtered_words = words.select { |word| word.date_added == date }

  if filtered_words.empty?
    puts "No words found for the given date."
  else
    show_all_words(filtered_words)
  end
end

def filter_words_by_category(words)
  puts "Enter the category to filter by:"
  category = get_input
  filtered_words = words.select { |word| word.category == category }

  if filtered_words.empty?
    puts "No words found for the given category."
  else
    show_all_words(filtered_words)
  end
end

def filter_words_by_language(words)
  puts "Enter the language to filter by:"
  language = get_input
  filtered_words = words.select { |word| word.language == language }

  if filtered_words.empty?
    puts "No words found for the given language."
  else
    show_all_words(filtered_words)
  end
end
