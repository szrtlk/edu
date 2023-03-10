## Работа с HTML

### Комментарий к курсу
* код в виде столбца будет здесь для удобства отображаться одной строкой, новая строка обозначается знаком /
* пример: const firstName = 'Pavel' / const lastName = 'Ivanov' / age = 35
* результат работы программы будет здесь отображаться после знака =>

### Теги 
* теги содержатся в <>
* теги бывают открывающие (<tag>), закрывающие(</tag>) и одинарные (<tag/>)
* если тег будет одинарным, это будет указано отдельно

### Атрибуты
* атрибут - свойство тега
* пример атрибутов: charset, title
* пример использования атрибутов: <meta charset="UTF-8"/>, <abbr title="Hypertext Markup Language">
* атрибут указывается в открывающем или одиночном теге
* значение атрибута указывается в "" после знака =

### Отображение нестандартных символов
* < - &lt;
* > - &gt;
* & - &amp;
* " - &quot;

### Комментарии в коде
* пример комментария - <!-- Комментарий -->

### Основные теги
* <html> - информация о наличии кода HTML
* <head> - информация о заголовке странице
* <body> - содержимое странице

### Теги раздела <head>
* <meta> - метаданные, *одиночный тег*
* <meta charset="UTF-8"/> - информация о кодировке 
* <title> - заголок страницы

### Теги раздела <body>
* <h1> - заголовок 1 уровня
* <h2> - заголовок 2 уровня 
* <h3> - заголовок 3 уровня
* <h4> - заголовок 4 уровня
* <h5> - заголовок 5 уровня
* <h6> - заголовок 6 уровня, меньше обычного текста
* <p> - обычный текст
* <br/> - перенос текста, *одиночный тег*

### Теги форматирования
* <pre> - текст с сохранением всех символов форматирования, включая табуляции, пробелы и переносы строк
* <small> - маленький текст
* <b> - жирный текст
* <i> - курсивный текст
* <u> - подчёркнутый текст
* <s> - зачёркнутый текст
* <strong> - жирный текст, логическое выделение
* <em> - курсивный текст, логическое выделение
* <ins> - подчёркнутый текст, пометка текста как добавленного вместо неверного
* <del> - зачёркнутый текст, пометка текста как неверного
* <sub> - текст в нижнем регистре
* <sup> - текст в верхнем регистре
* <q> - цитата, текст в кавычках
* <blockquote> - цитата, текст в отдельном блоке
* <samp> - текст в виде примера
* <bdo dir="rtl"> - текст справа налево

### Прочие теги форматирования
* <code> - текст, представляющий компьютерный код
* <var> - текст, представляющий переменную
* <kbd> - текст, который введён с клавиатуры
* <abbr> - текст аббревиатуры
* <address> - текст адреса, отображается курсивом

### Ссылки
* <a> - ссылка
* внутри тега задаётся название ссылки, а адрес ссылки задаётся в атрибуте href
* пример - <a href="https://www.google.com">Google</a>

### Якоря
* 