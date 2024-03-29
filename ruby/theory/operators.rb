# задаём переменную с текстом
# задаём переменные с результатами математических операций
# задаём переменные с результатом сравнений
# выводим переменные
# для переменной с текстом будет выведен текст
# для переменных с результатами математических операций будет выведено число
# для переменных с результатом сравнений будет выведено true или false

name = 'Sasha'
add = 1 + 2
sub = 2 - 1
mult = 2 * 2
div = 2 / 2
eq_1 = 1 < 2
eq_2 = 1 > 2
eq_3 = 1 == 2
eq_4 = 2 == 2
eq_5 = 2 >= 2
eq_6 = 2 <= 2

puts name
puts add
puts sub
puts mult
puts div
puts eq_1
puts eq_2
puts eq_3
puts eq_4
puts eq_5
puts eq_6
puts "#{eq_5}" + "#{eq_6}"

puts '---'

# показана работа оператора И для 3 случаев: true и true, true и false, false и false
# результат true будет только в первом случае (необходимо соблюдение 2 условий)

puts (1 < 2) && (5 < 6)
puts (1 < 2) && (5 > 6)
puts (1 > 2) && (5 > 6)

puts '---'

# показана работа оператора ИЛИ для 3 случаев: true или true, true или false, false или false
# результат true будет в первом и во втором случае (необходимо соблюдения хотя бы 1 из 2 условий)

puts (1 < 2) || (5 < 6)
puts (1 < 2) || (5 > 6)
puts (1 > 2) || (5 > 6)
