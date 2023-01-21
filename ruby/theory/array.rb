# создаём 2 массива (заданы разными способами)
# выводим массивы
# выводим элементы массива
# в первый массив добавляем новый элемент в конец и удаляем первый элемент
# во втором массиве удаляем последний элемент

array1 = ['Dasha', 'Masha', 'Pasha']
array2 =%w[Oleg Igor Stepan]

p array1
p array2

p array1[0]
p array1[1]
p array1[2]

p array2[0]
p array2[1]
p array2[2]

array1.push('Sasha')
array1.shift
p array1

array2.pop
p array2
