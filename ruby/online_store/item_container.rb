# создаём модуль ItemContainer
# 1 метод класса добавляет новый элемент массива в конец
# 2 метод класса удаляет последний элемент массива
# 3 метод класса проверяет, есть ли элемента массива со значением price == 0
# 4 массив удаляет такие элементы массива

module ItemContainer

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