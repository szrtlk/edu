# создаём класс языков
# задаём аксессор для языков
# инициализируем массив языков
# создаём методы добавления нового элемента и удаления последнего элемента в массиве языков

class Languages

attr_accessor :languages

def initialize
  @languages = []
end

def add_language(language)
  @languages.push language
end

def delete_last_language
  @languages.pop
end

end

# создаём класс рубрик
# задаём аксессор для рубрик
# инициализируем массив рубрик
# создаём методы добавления нового элемента и удаления последнего элемента в массиве рубрик

class Categories

  attr_accessor :categories

  def initialize
    @categories = []
  end

    def add_category(category)
    @categories.push category
  end

  def delete_last_category
    @categories.pop
  end

end

# создаём класс слов
# задаём аксессор для слов
# инициализируем массив слов
# инициализируем 3 параметра: дата, язык, рубрика
# создаём методы добавления нового элемента и удаления последнего элемента в массиве слов

class Words

  attr_accessor :words

  def initialize(parameters={})
    @words = []
    @date = parameters[:date]
    @language = parameters[:language]
    @category = parameters[:category]
  end

  def add_word(word)
    @words.push word
  end

  def delete_last_word
    @words.pop
  end

end

# создаём несколько языков, рубрик и слов для примера

language = Languages.new
language.add_language('english')
language.add_language('czech')
language.add_language('serbian')
language.add_language('russian')

category = Categories.new
category.add_category('food')
category.add_category('clothes')
category.add_category('furniture')
category.add_category('house')

word = Words.new
word.add_word('food')
word.add_word('bread')
word.add_word('clothes')
word.add_word('furniture')
word.add_word('house')

# далее представлен алгоритм работы программы
# сначала пользователь вводит своё имя
# далее выбирает 1 из 5 валидных команд
# в случае использования невалидной команды появляется соответствующее сообщение

puts 'Welcome to Wordbook!'
puts
puts 'Enter your name'
name = gets
puts
puts 'Hello, ' + name.chop + '!'

# зацикливаем исполнение программы, пока пользователь не выберет выход

decision = ''
while decision != 'exit'
puts
puts 'Please, choose the ACTION'
puts ' - add category'
puts ' - add language'
puts ' - add word'
puts ' - display categories'
puts ' - display languages'
puts ' - display words'
puts ' - exit'
puts
action = gets
decision = action.chop
puts
if action.chop == 'add category'
  puts 'Enter the name of the new category'
  action = gets
  category.add_category(action.chop)
elsif action.chop == 'add language'
  puts 'Enter the name of the new language'
  action = gets
  language.add_language(action.chop)
 elsif action.chop == 'add word'
  puts 'Enter the new word'
  action = gets
  word.add_word(action.chop)
elsif action.chop == 'display categories'
  p category.categories.each { |i| puts i }
elsif action.chop == 'display languages'
  p language.languages.each { |i| puts i }
elsif action.chop == 'display words'
  p word.words.each { |i| puts i }
elsif action.chop == 'exit'
  puts 'Good bye, ' + name.chop + "!"
else
  puts 'There is no such action'
end

end