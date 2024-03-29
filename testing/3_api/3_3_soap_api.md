## SOAP API

### SOAP API
* SOAP (simple object access protocol) - простой протокол доступа к объектам - протокол обмена структурированными сообщениями в распределённой вычислительной среде
* протокол используется для обмена произвольными сообщениями в формате XML
* SOAP API - веб-сервис, использующий протокол SOAP для обмена сообщениями между клиентами и серверами

### XML
* XML (extensible markup language) - простой, очень гибкий текстовый формат, устанавливающий набор правил для структурированных сообщений
* XML был создан для удобного хранения и передачи данных

### XSD
* XSD (XML schema definition) - язык описания структуры XML-документа
* XSD используется для определения правил, которым должен подчиняться документ, и был разработан так, чтобы его можно было использовать в создании ПО для обработки XML-документов
* XSD подключается и находится в отдельном файле

### XSD ОПРЕДЕЛЯЕТ
* элементы, которые могут появляться в XML-документе
* атрибуты, которые могут появляться в XML-документе
* какие элементы являются дочерними
* порядок дочерних элементов
* количество дочерних элементов
* пустой ли элемент или может содержать текст
* типы данных элементов и атрибутов
* фиксированные значения и значения по умолчанию элементов и атрибутов

### WSDL
* WSDL (web services description language) - язык на основе XML, который используется для описания веб-сервисов
* документ WSDL использует следующий элементы в определении сетевых служб
* **типы** - контейнер для определения типов данных с использованием некоторой системы типов (например, XSD)
* **сообщение** - абстрактное типизированное определение передаваемых данных
* **операция** - абстрактное определение действия, поддерживаемого сервисом
* **тип порта** - абстрактный набор операций, поддерживаемых одной или несколькими конечными точками
* **привязка** - конкретный протокол и спецификация формата данных для определённого типа порта
* **порт** - единая конечная точка, определяемая как комбинация привязки сетевого адреса
* **сервис** - набор связанных конечных точек

### СТРУКТУРА SOAP-СООБЩЕНИЯ
* корректное SOAP-сообщение состоит из нескольких структурных элементов
* **envelope** - корневой элемент, определяет XML-документ как сообщение SOAP с помощью пространства имён
* **header** - включает в себя атрибуты сообщения, которые связаны с конкретным приложением
* **body** - сообщение, которое передаёт веб-приложение
* **fault**

### ОТЛИЧИЯ SOAP ОТ REST
* SOAP - протокол
* REST - архитектурный стиль

### НЕДОСТАТКИ SOAP
* объёмные сообщения
* поддержка только одного формата - XML
* схема работы по принципу "один запрос - один ответ"
* смена описания веб-сервиса может нарушить работу клиента

### В КАКИХ СЛУЧАЯХ ИСПОЛЬЗУЮТ SOAP
* асинхронная обработка и последующий вызов
* формальное средство коммуникации; если клиент и сервер имеют соглашение о формате обмена, то SOAP 1.2 предоставляет жёсткие спецификации для такого типа взаимодействия
* операции с состоянием; если приложение требует, чтобы состояние сохранялось от одного запроса к другому, то SOAP 1.2 предоставляет структуру для поддержки таких требований

### SOAP UI
* SOAP UI используется для тестирования SOAP
* для начала работы нужно указать ссылку на WSDL
