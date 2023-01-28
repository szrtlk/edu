# создаём модуль ItemContainer

module ItemContainer

  # создаём вложенный модуль
  # объявляем переменную MinPrice
  # метод класса задаёт значение условия, которое задаёт переменная MinPrice
  
  module ClassMethods

    MinPrice = 100

    def min_price
      MinPrice
    end

  end

  # создаём вложенный модуль
  # 1 метод класса добавляет новый элемент массива в конец при соблюдении условия
  # это условие задано с помощью метода min_price и действует для классов, использующих модуль
  # 2 метод класса удаляет последний элемент массива
  # 3 метод класса проверяет, есть ли элемента массива со значением price == 0
  # 4 массив удаляет такие элементы массива
  # 5 массив считает количество элементов с непустым значением аргумента price

  module InstanceMethods

    def add_item(item)
      @items.push item unless item.price < self.class.min_price
    end

    def remove_item
      @items.pop
    end

    def validate
      @items.each do |i|
        puts 'Item has no price' if i.price.nil?
      end
    end

    def delete_invalid_items
      @items.delete_if {|i| i.price.nil?}
    end

    def count_valid_items
      @items.count { |i| i.price }
    end

  end

  # создаём callback на include модулей
  # он позволяет добавлять ClassMethods, данные методы будут доступны непосредственно через класс
  # он позволяет добавлять InstanceNethods, данные методы будут добавляться как экземпляр класса
  # для InstanceMethods можно также использовать команду classes.send :include, InstanceMethods
  # таким образом, при вызове модуля ItemContainer автоматически будут вызваны вложенные модули

  def self.included (classes)
    classes.extend ClassMethods
    classes.class_eval { include InstanceMethods }
  end

end
