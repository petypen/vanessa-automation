﻿# language: ru



Функционал: Интерактивная справка. Основные кнопки работы со сценариями. Часть один.

Сценарий: Основные кнопки работы со сценариями. Часть один.

	* Привет! В этом уроке я расскажу тебе про кнопки, которые управляют созданием, сохранением и запуском сценариев. Давай откроем второй экземпляр Ванессы в режиме обучения.
		И я открываю Vanessa Automation в режиме обучения
		

	* Отлично. Смотри. Мы поговорим об этом наборе инструментов.
		И Я делаю подсветку группы элементов VA 'ЭтотСеанс' "ГруппаVanessaEditorВыполнениеСценариев" "Основные кнопки работы со сценариями"
		
	* Тут расположены кнопки, позволяющие создать, записать на диск и запустить сценарии на выполнение.

	* Давай рассмотрим их подробнее.

	* Эта кнопка позволяет создать новый сценарий. Давай нажмём на неё.
		И Я делаю подсветку элемента VA "ФормаVanessaEditorСоздатьНовыйСценарий" "Создать новый сценарий" и перемещаю курсор
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ФормаVanessaEditorСоздатьНовыйСценарий' UI Automation
		И Пауза 1
		

	* При этом создалась вкладка с новым сценарием. В нём уже есть несколько строк.
//		И я запоминаю элемент "Новый сценарий.feature" с типом "" процесса "ЭтотСеанс" в переменную "ИДЭлемента" UI Automation
//		И я запоминаю родителя элемента "Новый сценарий.feature" с типом "" процесса "ЭтотСеанс" в переменную "ИДРодителя" UI Automation
//		И я запоминаю родителя элемента "$ИДРодителя$" с типом "" процесса "ЭтотСеанс" в переменную "ИДРодителя2" UI Automation
		И я делаю эффект затемнения у элементов формы UI Automation "ЭтотСеанс"
			| 'Имя/ID'                 | 'Тип' |
			| 'Новый сценарий.feature' | ''    |

			| 'Имя'  | 'Значение'      |
			| 'text' | 'Новая вкладка' |

	* Про синтаксис написания сценариев мы поговорим в отдельных уроках. А пока пойдём дальше.

	* В этом подменю находится несколько команд по загрузке фича файлов и открытию некоторых специальных вкладок.
		И Я делаю подсветку элемента VA "ПодменюVanessaEditorЗагрузитьФичи" "Загрузка фич" и перемещаю курсор
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ПодменюVanessaEditorЗагрузитьФичи' UI Automation
		И Пауза 1
		И я перемещаю курсор к заголовку Vanessa Automation 


	
	* Эта команда позволяет загрузить один фича файл в редактор. После этого файл можно будет как редактировать, так и запустить на выполнение.
		И Я делаю подсветку элемента VA "VanessaEditorФормаЗагрузитьОднуФичу" "Загрузка одной фичи" и перемещаю курсор

	* Давай для примера загр^узим какой-нибудь фича файл из тех, что используется при тестировании нового релиза Vanessa Automation.	
		И я загружаю фича файлы в VA в режиме обучения "$КаталогИнструментов$\features\Core\Allure\Issue-34-ОтчетAllure.feature"
		И Пауза 3
		И выражение внутреннего языка 'КонтекстСохраняемый.ФормаVAВРежимеОбучения.ФлагСценарииЗагружены' стало Истинно в течение 20 секунд

	* Отлично. Фича файл загрузился. Двигаемся дальше.


	* Рядом находится команда, которая позволяет загрузить сразу несколько фича файлов из каталога и всех его подкатал^огов. Обычно это используется, когда пользователь хочет запустить сразу несколько фича файлов на выполнение.
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ПодменюVanessaEditorЗагрузитьФичи' UI Automation
		И Пауза 1
		И Я делаю подсветку элемента VA "VanessaEditorФормаЗагрузитьФичиИзКаталога" "Загрузка нескольких фич" и перемещаю курсор

	* Давай загр^узим несколько фича файлов из каталога. Опять воспользуемся файлами из поставки Vanessa Automation.
		И я загружаю фича файлы в VA в режиме обучения "$КаталогИнструментов$\features\Core\ErrorDetails"
		И Пауза 3
		И выражение внутреннего языка 'КонтекстСохраняемый.ФормаVAВРежимеОбучения.ФлагСценарииЗагружены' стало Истинно в течение 20 секунд 



	
	* Отлично. Фича файлы загрузились.

	* Важный момент. Если выполнить команду по загрузке нескольких фич из катал^ога, то Vanessa Automation перейдёт в режим выполнения фича файлов в дереве. При этом редактор сценариев будет недоступен.	
	* Это связано с тем, что редактор сценариев может в один момент запустить на выполнение только один фича файл.
	* В одном фича файле может быть много сценариев, но запустить из редактора можно в один момент только один фича файл.
	* А в режиме дерева можно запустить много фича файлов за один раз.
	* Чтобы вернуться в редактор сценария надо нажать эту кнопку
		И Я делаю подсветку элемента VA "ФормаПерейтиВVanessaEditor" "Перейти в редактор" и перемещаю курсор

	* Если перед этим сделать активной строку дерева, которая принадлежит какому-либо фича файлу, то именно этот файл откроется при переходе в редактор.
		Если существует элемент UI Automation "ЭтотСеанс" с именем "Детали ошибки Наименование" и типом "" тогда
			И я запоминаю строку "Детали ошибки Наименование" в переменную "ИмяПоля"
		Иначе		
			И я запоминаю строку "Детали ошибки Description" в переменную "ИмяПоля"

		И я делаю эффект затемнения у элементов формы UI Automation "ЭтотСеанс"
				| 'Имя/ID'    | 'Тип' |
				| '$ИмяПоля$' | ''    |

				| 'Имя'  | 'Значение'        |
				| 'text' | 'Строка в дереве' |
			
		И Пауза 2
			
		И я делаю клик по элементу формы 'ЭтотСеанс' '$ИмяПоля$' '' UI Automation
		И Пауза 1
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ФормаПерейтиВVanessaEditor' UI Automation
	
	* С этим разобрались. Идём дальше.
	* В том же подменю далее идёт команда, которая позволяет открыть в редакторе произвольный файл в формате марк даун.
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ПодменюVanessaEditorЗагрузитьФичи' UI Automation
		И Пауза 1
		И Я делаю подсветку элемента VA "VanessaEditorЗагрузитьФайлДокументации" "Открыть MD файл" и перемещаю курсор

	* Давай для примера откроем файл рид ми из поставки Vanessa Automation.
		И я делаю клик по заголовку Vanessa Automation 
		И я загружаю файл маркдаун в VA в режиме обучения "$КаталогИнструментов$\docs\index.md"
		И Пауза 1
		
	* Файл загрузился. Редактирование маркдаун файлов не поддерживается, поэтому файл открыт в режиме только просмотра.

	* Далее идёт команда, которая открывает начальную страницу.
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ПодменюVanessaEditorЗагрузитьФичи' UI Automation
		И Пауза 1
		И Я делаю подсветку элемента VA "VanessaEditorWelcome" "Начальная страница" и перемещаю курсор

	* Давай откроем её.
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'VanessaEditorWelcome' UI Automation
		И Пауза 1
		
	* Начальная страница позволяет выполнить часто используемые команды, такие как создание сценария, открытие фича файлов, которые пользователь недавно использовал и другие.
	
	* И осталось рассмотреть ещё несколько команд. Они позволяют открыть недавно открытые файлы.
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ПодменюVanessaEditorЗагрузитьФичи' UI Automation
		И Пауза 1
		И я делаю подсветку элементов VA "ЭтотСеанс" "Недавно открытые файлы" UI Automation
			| 'Имя'                |
			| 'МенюЗагрузитьФичи1' |
			| 'МенюЗагрузитьФичи2' |
			| 'МенюЗагрузитьФичи3' |

	* Эти команды автоматически обновляются, когда вы загружаете фича файл или каталог фича файлов.

	* На этом всё, переходи к следующему уроку интерактивной справки.
		И я делаю клик по заголовку Vanessa Automation 


