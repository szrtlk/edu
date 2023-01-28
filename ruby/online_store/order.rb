# создаём класс Order
# задан геттер для аргумента items
# добавляем вложенные модули  Manager и Info модуля ItemContainer, предварительно запуская файл с модулем
# метод initialize задаёт пустой массив

class Order

  attr_reader :items

  require_relative 'item_container'
  include ItemContainer

  def initialize
    @items=[]
  end

end