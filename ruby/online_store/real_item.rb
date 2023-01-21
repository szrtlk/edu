# создан класс RealItem
# он наследует свойства и методы класса Item
# запускаем файл init.rb, который содержит данные о классе Item
# задаём дополнительный аргумент для класса RealItem - weight
# но так как мы перезапускаем методы, то для того, чтобы были доступны аргументы класса Item, используем внутри метода команду super

class RealItem < Item

  require_relative 'item'

  attr_accessor :weight

  def initialize(options)
    @weight = options[:weight]
    super
  end

  def info
    if block_given?
      yield weight
      super
    else
      puts 'Nothing to show'
    end
  end

end