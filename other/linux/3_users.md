## ПРАВА ДОСТУПА И ПОЛЬЗОВАТЕЛИ

### КЛАССИФИКАЦИЯ ПОЛЬЗОВАТЕЛЕЙ В LINUX
|параметр|суперпользователь|обычный пользователь|системный пользователь|
|---|---|---|---|
|название|root|user|daemon|
|UID (user ID)|UID = 0|UID >= 1000|1 <= UID < 1000|
|домашняя директория|/root|/home/user|любая|
|пароль|может не быть|есть|нет|
|shell (оболочка)|есть|есть|нет|
|доступ|неограниченный|в рамках домашней директории|ограниченный|

### АТРИБУТЫ ПОЛЬЗОВАТЕЛЯ
* UID (user ID)
* GID (group ID)
* домашняя директория (home) - /home/user
* логин (login)
* пароль (password)
* оболочка (shell) - /bin/bash

### ХРАНЕНИЕ ДАННЫХ О ПОЛЬЗОВАТЕЛЯХ
* /etc/passwd - список пользователей
* /etc/group - группы пользователей
* /etc/shadow - пароли пользователей
* /etc/skel - заготовки файлов для создания нового пользователя (.bash_logout, .bashrc, .profile)

### СПИСОК ПОЛЬЗОВАТЕЛЕЙ
* список пользователей можно посмотреть с помощью команды cat /etc/passwd
* пример строки в файле - root:х:0:0:root:/root:/bin/bash
* root - имя пользователя
* x - пароль пользователя (в файле не представлен)
* 0 - UID
* 0 - GID
* root - полное имя пользователя (содержит параметры через запятую - полное имя, номер комнаты, рабочий телефон, домашний телефон, другое)
* /root - домашняя директория
* /bin/bash - оболочка

### СПИСОК ГРУПП
* список групп можно посмотреть с помощью команды cat /etc/group
* пример строки в файле - root:х:0:
* root - имя группы
* x - пароль группы (в файле не представлен)
* 0 - GID
* в конце представлен список пользователей, которые входят в группу (для большинства групп список пустой); здесь указываются пользователи, для которых эта группа является дополнительной; несколько пользователей разделяются запятой

### СПИСОК ПАРОЛЕЙ ПОЛЬЗОВАТЕЛЕЙ
* список паролей пользователей можно посмотреть с помощью команды sudo cat /etc/shadow
* пример строки в файле - root:!:19362:0:99999:7:::
* root - логин пользователя
* ! - пароль (! или * значит, что пароль не установлен)
* далее идут свойства пароля
* 19362 - последняя дата изменения пароля
* 0 - минимальный срок действия пароля
* 99999 - максимальный срок действия пароля
* 7 - количество дней для предупреждения перед окончанием действия пароля)
* сам пароль хранится в зашифрованном виде (хэш-функция от пароля)

### УПРАВЛЕНИЕ ПОЛЬЗОВАТЕЛЯМИ
* данные команды осуществляются в режиме суперпользователя, нужно использовать команду sudo
* useradd - создание пользователя
* adduser - создание пользователя (скрипт)
* usermod - изменение пользователя
* userdel - удаление пользователя
* passwd - изменение пароля
* chage - изменение свойств пароля
* groupadd - создание группы
* groupdel - удаление группы

### КОМАНДА USERADD
* sudo useradd -s /bin/bash -m -d /home/user user
* -s /bin/bash - параметр shell, установление оболочки bash
* -m -d /home/user - установление домашней директории
* user - логин
* tail /etc/passwd - проверка изменения списка пользователей

### КОМАНДА ADDUSER
* sudo adduser user
* user - логин
* далее задаём пароль, полное имя пользователя
* автоматически задаётся домашняя директория и оболочка bash
* tail /etc/passwd - проверка изменения списка пользователей
* sudo tail /etc/shadow - проверка изменения списка паролей

### КОМАНДА PASSWD
* ввод команды без параметров и без команды sudo означает изменение пароля текущего пользователя
* sudo passwd user
* user - логин пользователя, чей пароль хотим поменять
* далее вводим пароль
* sudo tail /etc/shadow - проверка изменения списка паролей

### КОМАНДА USERMOD
* команда позволяет добавить пользователя в дополнительную группу и поменять основную группу
* sudo usermod -aG adm user
* -aG adm - добавление пользователя в дополнительную группу adm
* sudo usermod -g adm user
* -g adm - изменение основной группы пользователя на adm
* user - логин пользователя
* id - команда без параметров показывает UID и GID текущего пользователя и список групп, в которых он состоит
* sudo id user - команда показывает UID и GID указанного пользователя и список групп, в которых он состоит
* добавление пользователя в группу начинает действовать после перезапуска сессии пользователя, если при добавлении в группу его сессия была активна
* -L - блокирование пользователя (добавление ! перед паролем)
* -U - разблокирование пользователя (удаление ! перед паролем)

### КОМАНДА USERDEL
* sudo userdel user
* user - логин пользователя
* после удаления пользователя его домашняя директория сохраняется
* -r - удаление пользователя вместе с его домашней директорией

### КОМАНДА CHAGE
* sudo chage user
* user - логин пользователя
* далее задаём свойства пароля (минимальный срок действия пароля, максимальный срок действия пароля, последняя дата изменения пароля, количество дней для предупреждения перед окончанием действия пароля, количество дней для деактивации учётной записи, дата истечения срока действия учётной записи)

### КОМАНДЫ GROUPADD И GROUPDEL
* sudo groupadd group
* sudo groupdel group
* group - название группы

### МЕХАНИЗМ SU И SUDO
* su - переключение пользователя (указать логин пользователя, далее ввести пароль данного пользователя)
* данной командой не получится воспользоваться, если у пользователя не установлен пароль или указан запретный shell
* sudo su - переключение на суперпользователя (root)
* при использовании данных команд запускается вложенная оболочка
* выход из оболочки - команда exit
* sudo - выполнение команды с правами суперпользователя
* /etc/sudoers - конфигурация sudo
* visudo - редактирование конфигурации sudo (запускается в режиме sudo)

### РАБОТА С VISUDO
* sudo visudo
* открывается временный файл, в который вносятся изменения; если изменения соответствуют корректному синтаксису, они сохраняются в основной файл
* пример строки - root    ALL=(ALL:ALL) ALL
* пример строки - %admin ALL=(ALL) ALL
* пример строки - %sudo   ALL=(ALL:ALL) ALL
* % - признак группы
* ALL в конце означает набор доступных команд (ALL - все команды, можно вместо этого указать путь исполняемых файлов через запятую)
* NOPASSWD:ALL в конце отменяет ввод пароля (не рекомендуется)
* можно добавлять пользователей и группы и задавать им права
* /etc/sudoers.d - место хранения конфигураций

### ИЗМЕНЕНИЕ ВЛАДЕЛЬЦА ФАЙЛОВ И ГРУППЫ ВЛАДЕЛЬЦА ФАЙЛОВ
* данные команды осуществляются в режиме суперпользователя, нужно использовать команду sudo
* chown - изменение владельца и группы
* chown -R - изменение владельца и группы (включая вложенные папки и файлы)
* chown user:group - пример изменения владельца и группы
* chown user - пример изменения владельца
* chgrp - изменение группы
* chgrp -R - изменение группы (включая вложенные папки и файлы)
* chgrp group - пример изменения группы
* user - логин пользователя
* group - название группы
* после команды указывается файл или папка, владельца которых мы хотим поменять; рекомедуется указать абсолютный путь

### СТРУКТУРА СПИСКА LS -L
* пример строки - drwxrwxr-x 3 user group 4096 feb  2 06:12  projects
* drwxrwxr-x - информация о типе файла и правах доступа
* 3 - количество жётских ссылок
* user - владелец файла
* group - группа владельца файла
* 4096 - объём файла
* feb  2 06:12 - последняя дата изменения файла
* projects - название файла; * в конце файла означает бит на исполнение

### ИНФОРМАЦИЯ О ТИПЕ ФАЙЛА И ПРАВАХ ДОСТУПА
* drwxrwxr-x - информация о типе файла и правах доступа
* 1 символ, здесь d - тип файла (список типов файлов представлен ниже)
* 2-4 символы, здесь rwx - права владельца
* 5-7 символы, здесь rwx - права группы
* 8-10 символы, здесь r-x - права для остальных
* rwx, r-x, r-- называются битами доступа; имеют два значения - буква или прочерк

### БИТЫ ДОСТУПА
* r - read (чтение), 1 позиция
* w - write (запись), 2 позиция
* x - execute (исполнение), 3 позиция
* для файла чтение - чтение файла, запись - изменение файла, исполнение - запуск файла как программы
* для директории чтение - просмотр её объектов, запись - изменение списка её объектов, исполнение - работа с её объектами

### СПЕЦИАЛЬНЫЕ БИТЫ
* специальные биты соответствуют 3 позиции
* s - SUID - находится в разделе прав владельца; для исполняемых файлов; для запуска программы от имени владельца файла (например, пользователя root); числовая форма 4000
* S - SUID установлен, но нет бита на исполнение
* s - SGID - находится в разделе прав группы; для директорий; для создания файлов с группой, назначенной для директории; числовая форма 2000
* t - sticky bit - находится в разделе прав для остальных; для директорий; для удаления файлов только владельцем файла или директории; числовая форма 1000

### ТИПЫ ФАЙЛОВ
|Тип|Обозначение (ls)|
|---|---|
|обычный файл|-|
|директория|d|
|блочное устройство|b|
|символьное устройство|c|
|UNIX-сокет|s|
|именованный канал|p|
|символическая ссылка|l|

### АЛГОРИТМ ОПРЕДЕЛЕНИЯ ПРАВ ДОСТУПА
* является ли пользователь суперпользователем, в таком случае используются права суперпользователя, если нет, то
* является ли пользователь владельцем, в таком случае используются права владельца, если нет, то
* состоит ли пользователь в группе, в таком случае используются права группы, если нет, то
* используются права остальных

### ИЗМЕНЕНИЕ ПРАВ ДОСТУПА
* данная команда осуществляются в режиме суперпользователя, нужно использовать команду sudo
* chmod - изменение прав доступа
* chmod - R directory/ - изменение прав доступа (включая вложенные файлы и папки)
* chmod u=rwx, g=rx, o=r file - символьная форма (u - права владельца, g - права группы, o - права для остальных)
* можно комбинировать  u, g, o, например, ug, go, ugo (ugo можно заменить a)
* chmod +r file - добавить права на чтение (всем)
* chmod -r file - убрать права на чтение (всем)
* chmod u+r file - добавить права на чтение (владельцу)
* chmod u-r file - убрать права на чтение (владельцу)
* chmod 751 file - числовая форма (в данном примере 7 - права владельца, 5 - права группы, 1 - права для остальных)
* chmod 4755 file - числовая форма, изменение специальных битов (в данном примере 4 - специальный бит, 7 - права владельца, 5 - права группы, 5 - права для остальных)
* directory - название директории
* file - название файла
* числовая форма: 4 - бит чтения, 2 - бит записи, 1 - бит исполнения; складывая числовые значения, можно получить сочетания от 0 до 7

### ПРАВА ПО УМОЛЧАНИЮ И UMASK
* полные права - для файлов 666 (без бита на исполнения), для директорий 777
* права по умолчанию - для файлов 664, для директорий 775
* umask понижает права доступа, значение umask - 002
* umask - свойство оболочки Bash
* проверить значение umask можно с помощью команды umask
* umask - показывает текущее значение umask
* umask 022 - меняет значение umask на 022
