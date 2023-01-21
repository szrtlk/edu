# выводим элементы массива
# каждый элемент в отдельной строке

array = %w[Dasha Masha Pasha]
array.each {|name| puts name}

puts '---'

# выводим элементы массива
# каждый элемент в отдельной строке
# если есть элемент Masha, добавляем в конец элемент Sasha

array.each do |name|
  if name == 'Masha'
    array.push 'Sasha'
  end
  puts name
end

puts '---'

# пример блока без аргумента
# 5 раз выводим Hello Ruby

5.times {puts "Hello Ruby"}

puts '---'

# создаём хэш с 3 аргументами
# метод .each_key выводит название 3 аргументов (не значение!)

hash = {name: 'Dasha', age: 21, height: 175}
hash.each_key {|i| puts i}

puts '---'

# выводим значение и индекс для хэша и массива

hash.each_with_index {|value, index| puts value.to_s + " " + index.to_s}
array.each_with_index {|value, index| puts value.to_s + " " + index.to_s}

puts '---'

# выводим значение и индекс для хэша только для элемента с индексом 1

hash.each_with_index {|value, index| puts value if index == 1}

puts '---'

# выводим значение и индекс для массива только для элемента с индексом 1

array.each_with_index {|value, index| puts value if index == 1}

puts '---'

# создан класс Item
# задан аксессор для 3 аргументов
# с помощью метода initialize задаём 3 аргумента
# создаём метод info, который принимает блок info и выводит аргументы price, weight, name
# создаём экземпляр класса Item и задаём для него 3 аргумента
# с помощью блока info выводим для данного экземпляра класса Item значение аргументов price, weight, name (при условии, что задан блок)

class Item

  attr_accessor :price, :weight, :name
  
  def initialize(options={})
    @price = options[:price]
    @weight = options[:weight]
    @name = options[:name]
  end

   def info
    if block_given?
      yield price
      yield weight
      yield name
    else
      puts 'Nothing to show'
    end
  end

end

item = Item.new({price: 25, weight: 120, name: 'Car'})
item.info { |value| puts value }
item.info

puts '---'

# записываем строку "Hello Ruby" в файл block.txt
# используем команду File.open
# w - значит запись (write)
# в блоке задаём файл переменной y и выводим строку Hello Ruby
# по сути мы меняем содержимое файла на Hello Ruby

File.open("block.txt", "w") { |y| y.puts "Hello Ruby" }
