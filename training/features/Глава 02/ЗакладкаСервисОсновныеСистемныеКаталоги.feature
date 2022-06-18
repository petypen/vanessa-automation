﻿# language: ru

@lessons

Функционал: Интерактивная справка. Системные каталоги.

Сценарий: Системные каталоги

	* Привет! В этом уроке я расскажу тебе про то, какие бывают настройки связанные с системными каталогами. Давай откроем второй экземпляр Ванессы в режиме обучения.
		И я открываю Vanessa Automation в режиме обучения
		
	* Данные настройки находится тут.
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ГруппаНастройки' UI Automation
		И Пауза 1
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ГруппаСистемныеКаталоги' UI Automation
		И Пауза 1
		И я делаю подсветку нескольких элементов VA с их заголовком "Системные каталоги" UI Automation
			| 'Имя'                 |
			| 'КаталогПроекта1'     |
			| 'КаталогИнструментов' |

	* В данном поле указывается каталог проекта.
		И я делаю подсветку нескольких элементов VA с их заголовком "Каталог проекта" UI Automation
			| 'Имя'                 |
			| 'КаталогПроекта1'     |

	* Это важная настройка. Лучше всегда указывать каталог проекта.
	* В этом каталоге обычно находятся файлы, необходимые для запуска тестов.
	* Часто в сценариях может происходить обращение к файлам из каталога проекта.

	* Второе поле - это каталог инструментов.
		И я делаю подсветку нескольких элементов VA с их заголовком "Каталог инструментов" UI Automation
			| 'Имя'                 |
			| 'КаталогИнструментов' |
	* Это каталог, в котором находится обработка Vanessa Automation или Vanessa Automation Single.
	* Важно, чтобы это поле было заполнено корректно.


	* На этом всё, переходи к следующему уроку интерактивной справки.


