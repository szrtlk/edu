words = []

def add_word(words)
  puts "Enter the word:"
  word = gets.chomp
  puts "Enter the category:"
  category = gets.chomp
  puts "Enter the language:"
  language = gets.chomp
  words << { word: word, category: category, language: language, date_added: Time.now }
end

def filter_words(words, category: nil, language: nil, date_from: nil, date_to: nil)
  filtered_words = words.select do |w|
    (category.nil? || w[:category] == category) &&
      (language.nil? || w[:language] == language) &&
      (date_from.nil? || w[:date_added] >= date_from) &&
      (date_to.nil? || w[:date_added] <= date_to)
  end
  filtered_words.sort_by { |w| w[:date_added] }
end

def list_words(words)
  words.each do |w|
    puts "#{w[:word]} (#{w[:category]}, #{w[:language]}, added on #{w[:date_added]})"
  end
end

loop do
  puts "Enter command (add, filter, list, exit):"
  command = gets.chomp
  case command
  when 'add'
    add_word(words)
  when 'filter'
    puts "Enter category (optional):"
    category = gets.chomp
    category = nil if category.empty?
    puts "Enter language (optional):"
    language = gets.chomp
    language = nil if language.empty?
    puts "Enter date from (optional, format YYYY-MM-DD):"
    date_from = gets.chomp
    date_from = Time.parse(date_from) rescue nil if date_from
    puts "Enter date to (optional, format YYYY-MM-DD):"
    date_to = gets.chomp
    date_to = Time.parse(date_to) rescue nil if date_to
    filtered_words = filter_words(words, category: category, language: language, date_from: date_from, date_to: date_to)
    list_words(filtered_words)
  when 'list'
    list_words(words)
  when 'exit'
    break
  else
    puts "Unknown command"
  end
end
