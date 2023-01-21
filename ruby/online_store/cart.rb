# создаём класс Cart
# задан аксессор для аргумента items
# метод initialize задаёт пустой массив
# второй метод класса добавляет новый элемент массива в конец
# третий метод класса удаляет последний элемент массива
# четвёртый метод класса проверяет, есть ли элемента массива со значением price == 0
# пятый массив удаляет такие элементы массива

class Cart

attr_reader :items

  def initialize
    @items=[]
  end

  def add_item(item)
    @items.push item
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

end
