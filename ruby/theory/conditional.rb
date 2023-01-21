# представлены 3 примера

realname = 'Oleg'
name1 = 'Igor'
name2 = 'Pavel'
name3 = 'Ivan'

numb1 = 1
numb2 = 10
numb3 = 100
numb4 = 1000

# в первом примере команда выводит 'My name is ...", если переменная realname совпадает с name1, name2 или name 3
# в противном случае выводит 'My name is neither ... nor ... nor ... but ...'

if realname == name1
  puts 'My name is ' + name1
elsif realname == name2
  puts 'My name is ' + name2
elsif realname == name3
  puts 'My name is ' + name3
else
  puts 'My name is neither ' + name1 + ' nor ' + name2 + ' nor ' + name3 + ', but ' + realname
  end

# во втором примере команда выдаёт 1 из 2 вариантов в зависимости от того, соблюдаются все 3 условия или нет
# пока все 3 условия не соблюдаются, выводится 1 вариант
# если все 3 условия будут соблюдаться, то будет выведен 2 вариант

unless numb1 < numb2 && numb2 < numb3 && numb3 < numb4
  puts 'I do not say you my name'
else
  puts 'My name is ' + realname
end

# во третьем примере команда выдаёт 1 из 2 вариантов в зависимости от того, соблюдается хотя бы 1 из 3 условий или нет
# пока хотя бы 1 из 3 условий не соблюдается, выводится 1 вариант
# если хотя бы 1 из условий будет соблюдаться, то будет выведен 2 вариант

unless numb1 < numb2 || numb2 < numb3 || numb3 < numb4
  puts 'I do not say you my name'
else
  puts 'My name is ' + realname
end
