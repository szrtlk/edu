# создан класс Professions
# задан аксессор для 2 аргументов
# метод initialize задаёт пустой массив
# 3 метода корректируют массив (добавляют или удаляют элементы)

class Professions
  attr_accessor  :salary, :graphic

  def initialize
    @professions=[]
  end

  def recruit(workers)
    @professions.push workers
  end

  def fire_first
    @professions.shift
  end

  def fire_last
    @professions.pop
  end

end

# создан класс Workers
# задан аксессор для 2 аргументов
# метод initialize задаёт 2 аргумента

class Workers
  attr_accessor :surname, :name

  def initialize(options)
    @surname=options[:surname]
    @name=options[:name]
  end

end

# создаём 2 экземпляра класса Professions
# задаём для них аргументы

developers = Professions.new
testers = Professions.new
developers.salary = 2000
developers.graphic = '5 days a week'
testers.salary = 1000
testers.graphic = '5 days a week'

# создаём 6 экземпляров класса Workers, сразу задавая для них элементы

worker1 = Workers.new({surname: 'Ivanov', name: 'Ivan'})
worker2 = Workers.new({surname: 'Petrov', name: 'Petr'})
worker3 = Workers.new({surname: 'Pavlov', name: 'Pavel'})
worker4 = Workers.new({surname: 'Aleksandrov', name: 'Aleksandr'})
worker5 = Workers.new({surname: 'Myshkin', name: 'Igor'})
worker6 = Workers.new({surname: 'Rogov', name: 'Oleg'})

# используем для экземпляров класса Professions методы класса
# при необходимости задаём для них аргументы - в данном случае это экземпляры класса Workers
# в массив экземпляра developers попадут worker1 и worker2
# в массив экземпляра testers попадут worker4 и worker5

developers.recruit(worker1)
developers.recruit(worker2)
testers.recruit(worker3)
testers.recruit(worker4)
testers.recruit(worker5)
testers.recruit(worker6)
testers.fire_first
testers.fire_last

# выводим экземпляры класса Professions и их аргументы

p developers
p testers
