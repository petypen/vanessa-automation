﻿# language: ru



Функционал: Интерактивная справка. Управление озвучкой сценария и записью видео.

Сценарий: Управление озвучкой сценария и записью видео.

	* Привет! В этом уроке я расскажу тебе про кнопки, которые управляют озвучкой выполнения сценариев и записью видео. Давай откроем второй экземпляр Ванессы в режиме обучения.
		И я открываю Vanessa Automation в режиме обучения
		

	* Отлично. Смотри. Мы поговорим об этом наборе инструментов.
		И я делаю подсветку нескольких элементов VA  "Управление озвучкой сценария и записью видео" UI Automation
			| 'Имя'                                                  |
			| 'ПанельVanessaEditorОзвучиваниеВыполненияСценария'     |
			| 'ПанельVanessaEditorФормаВключитьВыключитьЗаписьВидео' |

	* Эта кнопка позволяет включить озвучку выполнения сценариев.
		И Я делаю подсветку элемента формы VA по имени "ПанельVanessaEditorОзвучиваниеВыполненияСценария" "Включение озвучки выполнения сценариев"

	* Она соответствует флагу в настройках Vanessa Automation. Давай найдём его.
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ГруппаНастройки' UI Automation
		И Пауза 1
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'СтраницаАвтоИнструкции' UI Automation
		И Пауза 1
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ГруппаАудио' UI Automation
		И Пауза 1
		
	* Отлично. Вот этот флаг.
		И я перемещаю курсор к заголовку Vanessa Automation 
		И Я делаю подсветку элемента формы VA по имени "ОзвучиватьВыполнениеСценария" "Флаг, соответствующий кнопке"


	* При нажатии на кнопку озвучки выполнения сценариев происходит установка флага.
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ПанельVanessaEditorОзвучиваниеВыполненияСценария' UI Automation
		И Я делаю подсветку элемента формы VA по имени "ОзвучиватьВыполнениеСценария" "Флаг, соответствующий кнопке"

	* При повторном нажатии на кнопку озвучки выполнения сценариев происходит снятие флага.
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ПанельVanessaEditorОзвучиваниеВыполненияСценария' UI Automation
		И Я делаю подсветку элемента формы VA по имени "ОзвучиватьВыполнениеСценария" "Флаг, соответствующий кнопке"

	* Важный момент. Чтобы озвучка выполнения сценария работала нужно задать настройки генерации г^олоса. 
	* Vanessa Automation поддерживает несколько движков генерации речи. О них рассказано в соответствующих уроках.
	* Пока просто зафиксируем, что эти настройки нужно будет задать соответствующим образом.
	* Ещё важный момент. Чтобы озвучка выполнения сценария работала нужно, чтобы сценарий был написан определённым образом.
	* Давай загр^узим тестовый пример, чтобы посмотреть как это должно выглядеть.
		И я устанавливаю опцию VA в режиме обучения "ПроверкаСинтаксисаВРедакторе" "Ложь"
		И я делаю клик по элементу формы VA UI Automation 'ЭтотСеанс' 'ГруппаЗапускТестов' UI Automation
		И я загружаю фича файлы в VA в режиме обучения "$КаталогИнструментов$\training\features\Глава 01\Пример\ПримерСценарияДляОзвучки.feature"
		И Пауза 1
		И выражение внутреннего языка 'КонтекстСохраняемый.ФормаVAВРежимеОбучения.ФлагСценарииЗагружены' стало Истинно в течение 20 секунд

	* Текст диктора должен быть написан в группах шагов. Эти строки начинаются с символа звёздочка.
	* Внутри групп шагов находятся те действия, которые будут выполняться в то время, когда диктор будет проговаривать текст.

	* На этом всё, переходи к следующему уроку интерактивной справки.



