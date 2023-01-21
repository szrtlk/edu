# создан класс Item
# задан аксессор для 2 аргументов
# задана переменная класса
# с помощью метода initialize задаём 2 аргумента
# создаём метод info, который принимает блок info и выводит аргументы price, name
# создаём экземпляр класса Item и задаём для него 2 аргумента
# с помощью блока info выводим для данного экземпляра класса Item значение аргументов price, name (при условии, что задан блок)

class Item

  attr_accessor :price, :name

  @@discount = 0.1

  def initialize(options={})
    @price = options[:price]
    @name = options[:name]
  end

  def info
    if block_given?
      yield price
      yield name
    else
      puts 'Nothing to show'
    end
  end

# создаём метод класса (т.е. метод, который можно использовать не на объекте, а на самом классе)
# задаём условие, которое зависит от месяца, используем переменную класса

  def self.discount
    if Time.now.month == 1
      @@discount * 3
    else
      @@discount
    end
  end

# для того, чтобы данный метод учитывал одноимённый метод класса наследующих классов, используем команду self.class

  def price_with_discount
    @price - @price * self.class.discount
  end

end
