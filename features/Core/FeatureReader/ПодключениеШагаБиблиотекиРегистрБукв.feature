﻿# encoding: utf-8
# language: ru

@IgnoreOnOFBuilds
@IgnoreOn82Builds

Функционал: Передача параметра в сценарй
	Как Разработчик
	Я Хочу чтобы я мог использовать параметризованные  вложенные сценарии
	Чтобы я мог упростить вызов однотипных сценариев
 

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий
	И    Я открываю VanessaBehavior в режиме TestClient 
 
Сценарий: Передач параметра во вложенный сценарий первого и второго уровня
	Когда В поле с именем "КаталогФичСлужебный" я указываю путь к служебной фиче "ДляПроверкиЗагрузкиШагаБиблиотекиСДругимРегистромБукв"
	И В открытой форме я перехожу к закладке с заголовком "Библиотеки"
	И В открытой форме я нажимаю на кнопку с именем "КаталогиБиблиотекДобавить"
	И я добавляю в библиотеки строку с стандартной библиотекой "Libraries"
	И     Я нажимаю на кнопку "Перезагрузить сценарии"
	И Пауза 9
	И     таблица формы с именем "ДеревоТестов" стала равной:
		| 'Строка процедуры вызова шага' |
		| ''                             |
		| ''                             |
		| ''                             |
		| 'ЯЗакрываюСеансTESTCLIENT'     |
		| 'ЯЗакрываюСеансTESTCLIENT'     |
