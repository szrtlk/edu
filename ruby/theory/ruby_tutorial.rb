class RubyTutorial

  def self.description

    # параллельное присваивание
    # если a == true => b, иначе => c

    a, b, c = 1, 2, 3
    p a ? b : c

    puts

    # представлен цикл for
    # пока i находится в диапазоне от 0 до 5 в первом случае и от 0 до 4 во втором случае, программа выводит i

    for i in 0..5
      p i
    end

    puts

    for i in 0...5
      p i
    end

    puts

    # выводим элементы массива разными способами

    array = %w[Sasha Dasha Pasha]
    array.map { |i| p i }
    puts
    array.map(&method(:p))
    puts
    array.each(&method(:p))

    puts

    # выводим класс объекта

    p 1.class
    p "1".class
    p [].class
    p :a.class
    p nil.class
    p true.class
    p false.class

    puts

    # преобразование в Integer, Float, String

    p 1.to_i
    p 1.to_f
    p 1.to_s

    puts

    # вывод случайного числа от 1 до 10 и от 1 до 9

    p rand(1..10)
    p rand(1...10)

    puts

    # преобразование регистра

    p 'SASHA'.downcase
    p 'sasha'.upcase
    p 'sasha eats pasta'.capitalize

    puts

    # преобразование строки в массив из её элементов (символов)
    # преобразование строки в массив из слов

    string = 'Sasha Masha'
    p string.chars
    p string.split

    puts

    # поиск элементов массива по условию

    arr = [1, 2, 3, 4, 5, 6]
    p arr.find_all{ |num| num.odd? }
    arr.find_all{ |num| p num.odd? }

    puts

    # реверсия хэша
    # при использовании метода reverse_each хэш преобразуется в массив, его можно преобразовать в хэш методом .to_h

    fruit_1 = { spring: 'apple', summer: 'pear', autumn: 'mango'}
    fruit_2 = fruit_1.reverse_each
    fruit_3 = fruit_1.reverse_each.to_h
    p fruit_1
    p fruit_2.to_h
    p fruit_3

    puts

    # работа с двумерным массивом

    cars = [ ['audi', 'black', 2008] , ['bmw', 'red', 2014] ]
    cars.each do |car, color, year| puts "car: #{car}, color: #{color}, year: #{year}" end

  end

end

RubyTutorial.description
