# запускаем все файлы с расширением .rb в этой папке
# для класса Dir задаём аргумент - все файлы с расширением .rb и используем метод-итератор .each, который перебирает все файлы (далее в блоке задаём аргумент file и используем команду require_relative)
# чтобы рабочий файл не запускался дважды, прописываем дополнительное условие

Dir["*.rb"].each { |file| require_relative file if file != 'init.rb' }

# создаём экземпляры класса Item и задаём для них аргументы (для первого экземпляра задан аргумент price, для второго - нет)

item1 = VirtualItem.new({price: 25, name: 'Car'})
item2 = RealItem.new({weight: 120, name: 'Car'})
item3 = RealItem.new({price: 25, weight: 120, name: 'Car'})

# создаём экземпляр класса Cart
# используем для него методы класса Cart, при необходимости задаём аргументы
# по сути мы добавляем в массив экземпляра класса cart 3 экземпляра класса Item, а потом удаляем элементы массива с price == 0, таким образом у нас в массиве остаётся только 1 из 2 элементов
# выводим экземпляр класса Cart и количество его элементов

cart = Cart.new
cart.add_item (item1)
cart.add_item (item2)
cart.add_item (item3)
cart.delete_invalid_items
p cart
p cart.items.size

# создаём экземпляр класса Order
# используем для него методы класса Order, при необходимости задаём аргументы
# по сути мы добавляем в массив экземпляра класса order 3 экземпляра класса Item, а потом удаляем элементы массива с price == 0, таким образом у нас в массиве остаётся только 1 из 2 элементов
# выводим экземпляр класса Order и количество его элементов

order = Order.new
order.add_item (item1)
order.add_item (item2)
order.add_item (item3)
order.delete_invalid_items
p order
p order.items.size

# проверяем, отвечают ли данные объекты на аргумент weight

p item1.respond_to? :weight
p item2.respond_to? :weight
p item3.respond_to? :weight

# используем метод класса

p Item.discount

# вызовем метод final_price для объектов класса Item

p item1.price
p item3.price
p item1.final_price
p item3.final_price