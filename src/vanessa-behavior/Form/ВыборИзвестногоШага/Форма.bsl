﻿&НаКлиенте
Функция ПолучитьДДFeatureReader()
	Возврат Новый ДвоичныеДанные(ЭтаФорма.ВладелецФормы.ПолучитьПутьКFeatureReader());
КонецФункции	

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Если ЯзыкГенератораGherkin = "ru" Тогда
		Элементы.ПоказатьПеревод.Видимость = Ложь;
	КонецЕсли;	 
	
	ДвДанныеvbFeatureReader = ПолучитьДДFeatureReader();
	ЗаполнитьДеревоИзвестныхШаговНаСервере(ДвДанныеvbFeatureReader);
КонецПроцедуры

&НаСервереБезКонтекста
Функция РазложитьСтрокуВМассивПодстрок(Знач Строка, Знач Разделитель = ",", Знач ПропускатьПустыеСтроки = Неопределено) Экспорт
	
	Результат = Новый Массив;
	
	// для обеспечения обратной совместимости
	Если ПропускатьПустыеСтроки = Неопределено Тогда
		ПропускатьПустыеСтроки = ?(Разделитель = " ", Истина, Ложь);
		Если ПустаяСтрока(Строка) Тогда 
			Если Разделитель = " " Тогда
				Результат.Добавить("");
			КонецЕсли;
			Возврат Результат;
		КонецЕсли;
	КонецЕсли;
		
	Позиция = Найти(Строка, Разделитель);
	Пока Позиция > 0 Цикл
		Подстрока = Лев(Строка, Позиция - 1);
		Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Подстрока) Тогда
			Результат.Добавить(Подстрока);
		КонецЕсли;
		Строка = Сред(Строка, Позиция + СтрДлина(Разделитель));
		Позиция = Найти(Строка, Разделитель);
	КонецЦикла;
	
	Если Не ПропускатьПустыеСтроки Или Не ПустаяСтрока(Строка) Тогда
		Результат.Добавить(Строка);
	КонецЕсли;
	
	Возврат Результат;
	
КонецФункции 

&НаСервере
Процедура ДобавитьТипыШагов(Дерево,Тип,ТаблицаПеревода)
	НайденныеСтрокиДерева = Дерево.Строки.НайтиСтроки(Новый Структура("ПолныйТипШага",Тип),Истина);
	Если НайденныеСтрокиДерева.Количество() = 0 Тогда
		ТекСтроки = Дерево.Строки;
		МассивТип = РазложитьСтрокуВМассивПодстрок(Тип,".");
		ПолныйТипШага = "";
		Для Каждого ПодТип Из МассивТип Цикл
			ЕстьПеревод = Ложь;
			
			Если ТаблицаПеревода <> Неопределено Тогда
				СтрокаТаблицаПеревода = ТаблицаПеревода.Найти(НРег(ПодТип),"ОригиналРусскийШагНРег");
				Если СтрокаТаблицаПеревода <> Неопределено Тогда
					ПодТип = СтрокаТаблицаПеревода.ТекстПереводаШаг;
					ЕстьПеревод = Истина;
				КонецЕсли;	 
			КонецЕсли;	 
			
			Если ПолныйТипШага = "" Тогда
				ПолныйТипШага = ПодТип;
			Иначе
				ПолныйТипШага = ПолныйТипШага + "." + ПодТип;
			КонецЕсли;	 
			
			Если Найти(ПолныйТипШага,"Нумерация") > 0 Тогда
				вава = 1;
			КонецЕсли;	 
			
			
			НайденныеСтрокиДерева = ТекСтроки.НайтиСтроки(Новый Структура("ТипШага",ПодТип),Ложь);
			Если НайденныеСтрокиДерева.Количество() = 0 Тогда
				ТекСтрока               = ТекСтроки.Добавить();
				ТекСтрока.ТипШага       = ПодТип;
				ТекСтрока.ПолныйТипШага = ПолныйТипШага;
				ТекСтрока.Язык          = "ru";
				Если ТаблицаПеревода <> Неопределено и ЕстьПеревод Тогда
					ТекСтрока.Язык          = ЯзыкГенератораGherkin;
				КонецЕсли;	 
				
				ТекСтроки = ТекСтрока.Строки;
			Иначе	
				ТекСтроки = НайденныеСтрокиДерева[0].Строки;
			КонецЕсли;	 
		КонецЦикла;	
	КонецЕсли;	 
КонецПроцедуры

&НаСервереБезКонтекста
Функция ПреобразоватьТипПеревод(Тип,ТаблицаПеревода)
	МассивТип = РазложитьСтрокуВМассивПодстрок(Тип,".");
	ПолныйТипШага = "";
	Для Каждого ПодТип Из МассивТип Цикл
		СтрокаТаблицаПеревода = ТаблицаПеревода.Найти(НРег(ПодТип),"ОригиналРусскийШагНРег");
		Если СтрокаТаблицаПеревода <> Неопределено Тогда
			ПодТип = СтрокаТаблицаПеревода.ТекстПереводаШаг;
		КонецЕсли;	 
		
		Если ПолныйТипШага = "" Тогда
			ПолныйТипШага = ПодТип;
		Иначе
			ПолныйТипШага = ПолныйТипШага + "." + ПодТип;
		КонецЕсли;	 
	КонецЦикла;	
	
	Возврат ПолныйТипШага;
КонецФункции	

&НаСервере
Процедура ДобавитьШаги(Дерево,Тип,ПредставлениеТеста,ОписаниеШага,ИмяФайла,ТаблицаПеревода,СтрТаблицаИзвестныхStepDefinition)
	
	Если ТаблицаПеревода <> Неопределено Тогда
		Тип = ПреобразоватьТипПеревод(Тип,ТаблицаПеревода);
	КонецЕсли;	 
	
	НайденныеСтрокиДерева = Дерево.Строки.НайтиСтроки(Новый Структура("ПолныйТипШага",Тип),Истина);
	Если НайденныеСтрокиДерева.Количество() = 0 Тогда
		ВызватьИсключение("Не найден тип шага <" + Тип + ">");
	КонецЕсли;
	
	
	СтрокаДерева = НайденныеСтрокиДерева[0];	
	СтрокаШага   = СтрокаДерева.Строки.Добавить();
	СтрокаШага.ПредставлениеТеста = ПредставлениеТеста;
	СтрокаШага.ОписаниеШага       = ОписаниеШага;
	СтрокаШага.ИмяФайла           = ИмяФайла;
	СтрокаШага.Язык               = "ru";
	
	Если ТаблицаПеревода <> Неопределено Тогда
		СтрокаПоиска = НРег(СтрТаблицаИзвестныхStepDefinition.Id);
		СтрокаПоиска = Лев(СтрокаПоиска,Найти(СтрокаПоиска,"(")-1);
		
		СтрокаТаблицаПеревода = ТаблицаПеревода.Найти(СтрокаПоиска,"СтрокаДляПоискаРусский");
		Если СтрокаТаблицаПеревода <> Неопределено Тогда
			СтрокаШага.Язык               = ЯзыкГенератораGherkin;
			СтрокаШага.ПредставлениеТеста = УбратьСлужебныеСимволыИзПредставления(СтрокаТаблицаПеревода.ТекстПереводаШаг);
			Если ЗначениеЗаполнено(СтрокаТаблицаПеревода.ТекстПереводаОписание) Тогда
				СтрокаШага.ОписаниеШага       = СтрокаТаблицаПеревода.ТекстПереводаОписание;
			КонецЕсли;	 
		Иначе
			Сообщить("Не найден перевод для шага <" + ПредставлениеТеста + ">");
		КонецЕсли;	 
	КонецЕсли;	 
	
КонецПроцедуры

Процедура ПроставитьРекурсивноСтрокуВПустойТип(Дерево,СлужебнаяСтрока,ЗаменятьПустойТип)
	Для Каждого СтрокаДерева Из Дерево.Строки Цикл
		Если ЗаменятьПустойТип Тогда
			Если СокрЛП(СтрокаДерева.ТипШага) = "" Тогда
				СтрокаДерева.ТипШага = СлужебнаяСтрока;
			КонецЕсли;	 
		Иначе	
			Если СтрокаДерева.ТипШага = СлужебнаяСтрока Тогда
				СтрокаДерева.ТипШага = "Другое";
			КонецЕсли;	 
		КонецЕсли;	 
		
		ПроставитьРекурсивноСтрокуВПустойТип(СтрокаДерева,СлужебнаяСтрока,ЗаменятьПустойТип);
	КонецЦикла;	
КонецПроцедуры

&НаСервере
Процедура СделатьСортировкуДерева(Дерево)
	//СлужебнаяСтрока = "Другое";
	//ПроставитьРекурсивноСтрокуВПустойТип(Дерево,СлужебнаяСтрока,Истина);
	Дерево.Строки.Сортировать("ТипШага,ОписаниеШага",Истина);
	//ПроставитьРекурсивноСтрокуВПустойТип(Дерево,СлужебнаяСтрока,Ложь);
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	ТаблицаИзвестныхStepDefinition.Загрузить(Параметры.ТаблицаИзвестныхStepDefinition.Выгрузить());
	
	ЯзыкГенератораGherkin = Параметры.ЯзыкГенератораGherkin;
	КаталогИнструментов   = Параметры.КаталогИнструментов;
	МакетШаблонПеревода   = Параметры.МакетШаблонПеревода;
	ДвоичныеДанныеФайлПеревода = ЗначениеВСтрокуВнутр(Параметры.ДвоичныеДанныеФайлПеревода);
	
	
	Для Каждого СтрокаТаблицаУжеСуществующихСценариев Из Параметры.ТаблицаУжеСуществующихСценариев Цикл
		СтрокаТаблицаИзвестныхStepDefinition = ТаблицаИзвестныхStepDefinition.Добавить();
		
		СтрокаТаблицаИзвестныхStepDefinition.ИмяФайла           = СтрокаТаблицаУжеСуществующихСценариев.ИмяФайла;
		СтрокаТаблицаИзвестныхStepDefinition.ТипШага            = СтрокаТаблицаУжеСуществующихСценариев.ТипШага;
		СтрокаТаблицаИзвестныхStepDefinition.ПредставлениеТеста = СтрокаТаблицаУжеСуществующихСценариев.ПримерИспользования;
		СтрокаТаблицаИзвестныхStepDefinition.ОписаниеШага       = СтрокаТаблицаУжеСуществующихСценариев.ОписаниеШага;
	КонецЦикла;	
КонецПроцедуры

&НаКлиенте
Функция ПолучитьФайлыПеревода()
	Соответствие = Новый Соответствие;
	Соответствие.Вставить("en",Новый ДвоичныеДанные(Объект.КаталогИнструментов + "\locales\Gherkin\en.mxl"));
	Соответствие.Вставить("ro",Новый ДвоичныеДанные(Объект.КаталогИнструментов + "\locales\Gherkin\ro.mxl"));
КонецФункции	


&НаСервере
Функция ПолучитьТаблицуПеревода(ДвДанныеvbFeatureReader)
	Если ЗначениеЗаполнено(КешТаблицыПеревода) Тогда
		Возврат ЗначениеИзСтрокиВнутр(КешТаблицыПеревода);
	КонецЕсли;	 
	
	ТаблицаДляПереводаИзвестныхШагов = Новый ТаблицаЗначений;
	ТаблицаДляПереводаИзвестныхШагов.Колонки.Добавить("ОригиналРусскийШаг");
	ТаблицаДляПереводаИзвестныхШагов.Колонки.Добавить("ОригиналРусскийОписаниеШага");
	ТаблицаДляПереводаИзвестныхШагов.Колонки.Добавить("Перевод");
	
	
	//ЗаполнитьТаблицуДляПеревода(ТаблицаДляПереводаИзвестныхШагов,ДеревоСервер);
	
	
	
	ДанныеПеревода = Новый Структура;
	ДанныеПеревода.Вставить("ЯзыкПеревода",ЯзыкГенератораGherkin);
	
	ДанныеПеревода.Вставить("ДвоичныеДанныеФайлПеревода",ЗначениеИзСтрокиВнутр(ДвоичныеДанныеФайлПеревода));
	ДанныеПеревода.Вставить("ФормированиеТаблицыДляДальнейшегоПеревода",Истина);
	
	ДанныеПеревода.Вставить("ТаблицаДляПереводаИзвестныхШагов",ТаблицаДляПереводаИзвестныхШагов);
	ДанныеПеревода.Вставить("МакетШаблонПеревода",МакетШаблонПеревода);
	
	
	
	
	
	ВременноеИмяФайла = Неопределено;
	FeatureReader = СоздатьFeatureReader(КаталогИнструментов, ДвДанныеvbFeatureReader, ВременноеИмяФайла);
	
	FeatureReader.ПолучитьПереводТекстаGherkin(ДанныеПеревода);
	
	КешТаблицыПеревода = ЗначениеВСтрокуВнутр(ДанныеПеревода.ТаблицаПеревода);
	Возврат ДанныеПеревода.ТаблицаПеревода;
КонецФункции	

&НаСервере
Функция УбратьСлужебныеСимволыИзПредставления(Знач Стр)
	Стр = СтрЗаменить(Стр,"%1 ","");
	Стр = СтрЗаменить(Стр,"%2 ","");
	Стр = СтрЗаменить(Стр,"%3 ","");
	Стр = СтрЗаменить(Стр,"%4 ","");
	Стр = СтрЗаменить(Стр,"%5 ","");
	Стр = СтрЗаменить(Стр,"%6 ","");
	Стр = СтрЗаменить(Стр,"%7 ","");
	
	Возврат Стр;
КонецФункции	

&НаСервере
Процедура ЗаменитьПредставлениеТестаВТаблице(ТаблицаПеревода,Тзн)
	Для Каждого СтрокаТзн Из Тзн Цикл
		СтрокаДляПоиска = СтрокаТзн.СтрокаДляПоиска;
		СтрТаблицаПеревода = ТаблицаПеревода.Найти(СтрокаДляПоиска,"СтрокаДляПоискаРусский");
		
		Если СтрТаблицаПеревода <> Неопределено Тогда
			Если ЗначениеЗаполнено(СтрТаблицаПеревода.ТекстПереводаШаг) Тогда
				СтрокаТзн.ПредставлениеТеста = СтрТаблицаПеревода.ТекстПереводаШаг;
			КонецЕсли;	 
			
			Если ЗначениеЗаполнено(СтрТаблицаПеревода.ТекстПереводаОписание) Тогда
				СтрокаТзн.ОписаниеШага       = СтрТаблицаПеревода.ТекстПереводаОписание;
			КонецЕсли;	 
		КонецЕсли;	 
	КонецЦикла;	
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьДеревоИзвестныхШаговНаСервере(ДвДанныеvbFeatureReader)
	ТабРезультат = РеквизитФормыВЗначение("ТаблицаИзвестныхStepDefinition");

	ТаблицаПеревода = Неопределено;
	Если ЯзыкГенератораGherkin <> "ru" Тогда
		ТаблицаПеревода = ПолучитьТаблицуПеревода(ДвДанныеvbFeatureReader);
		ЗаменитьПредставлениеТестаВТаблице(ТаблицаПеревода,ТабРезультат);
	КонецЕсли;	 
	
	Дерево = РеквизитФормыВЗначение("ДеревоШагов");
	
	Если Ложь Тогда
		Дерево = Новый ДеревоЗначений;
	КонецЕсли;
	Дерево.Строки.Очистить();
	
	//получить список шагов с учетом фильтра
	Если ЗначениеЗаполнено(ФильтрДереваШагов) Тогда
		Построитель = Новый ПостроительЗапроса;
		Построитель.ИсточникДанных = Новый ОписаниеИсточникаДанных(ТабРезультат);

		тОтбор = Построитель.Отбор.Добавить("ПредставлениеТеста");
		тОтбор.ВидСравнения = ВидСравнения.Содержит;
		тОтбор.Значение = ФильтрДереваШагов;
		тОтбор.Использование = Истина;
		
		Построитель.Выполнить();
		ТабРезультат = Построитель.Результат.Выгрузить();
	КонецЕсли;	
	
	Для Каждого СтрТаблицаИзвестныхStepDefinition Из ТабРезультат Цикл
		Тип = СокрЛП(СтрТаблицаИзвестныхStepDefinition.ТипШага);
		Если ПоказыватьСлужебныеШаги И Тип = "" Тогда
			Тип = "Служебные";
		ИначеЕсли Тип = "" Тогда
			Продолжить;
		КонецЕсли;
		
		ДобавитьТипыШагов(Дерево,Тип,ТаблицаПеревода); //группы
	КонецЦикла;
	
	Для Каждого СтрТаблицаИзвестныхStepDefinition Из ТабРезультат Цикл
		Тип = СокрЛП(СтрТаблицаИзвестныхStepDefinition.ТипШага);
		Если ПоказыватьСлужебныеШаги И Тип = "" Тогда
			Тип = "Служебные";
		ИначеЕсли Тип = "" Тогда
			Продолжить;
		КонецЕсли;
		
		Данные = СтрТаблицаИзвестныхStepDefinition;
		
		ДобавитьШаги(Дерево,Тип,Данные.ПредставлениеТеста,Данные.ОписаниеШага,Данные.ИмяФайла,ТаблицаПеревода,СтрТаблицаИзвестныхStepDefinition);
	КонецЦикла;	
	
	СделатьСортировкуДерева(Дерево);
	
	ЗначениеВРеквизитФормы(Дерево,"ДеревоШагов");

КонецПроцедуры

&НаКлиенте
Процедура ДеревоШаговВыбор(Элемент, ВыбраннаяСтрока, Поле, СтандартнаяОбработка)
	Если Не ЗначениеЗаполнено(Элемент.ТекущиеДанные.ПредставлениеТеста) Тогда
		Возврат;
	КонецЕсли;	
	
	Оповестить("ВыборИзвестногоШага",Элемент.ТекущиеДанные.ПредставлениеТеста);
	Сообщить("Добавил шаг: " + Элемент.ТекущиеДанные.ПредставлениеТеста);
КонецПроцедуры

&НаКлиенте
Процедура ПоказыватьСлужебныеШагиПриИзменении(Элемент)
	ДвДанныеvbFeatureReader = ПолучитьДДFeatureReader();
	ЗаполнитьДеревоИзвестныхШаговНаСервере(ДвДанныеvbFeatureReader);
КонецПроцедуры

&НаКлиенте
Процедура РазвернутьСтрокуДерева(Строка)
	ИдентификаторСтроки=Строка.ПолучитьИдентификатор();
	Элементы.ДеревоШагов.Развернуть(ИдентификаторСтроки);
КонецПроцедуры

&НаКлиенте
Процедура СвернутьСтрокуДерева(Строка)
	ИдентификаторСтроки=Строка.ПолучитьИдентификатор();
	Элементы.ДеревоШагов.Свернуть(ИдентификаторСтроки);
КонецПроцедуры

&НаКлиенте
Процедура РазвернутьСтрокиДерева(ДеревоФормыСтроки)
	Для Каждого Строка Из ДеревоФормыСтроки Цикл
		РазвернутьСтрокуДерева(Строка);
		РазвернутьСтрокиДерева(Строка.ПолучитьЭлементы());
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура СвернутьСтрокиДерева(ДеревоФормыСтроки)
	Для Каждого Строка Из ДеревоФормыСтроки Цикл
		СвернутьСтрокуДерева(Строка);
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура НайтиШагиПриИзменении(Элемент)
	ДвДанныеvbFeatureReader = ПолучитьДДFeatureReader();
	ЗаполнитьДеревоИзвестныхШаговНаСервере(ДвДанныеvbFeatureReader);
	Если Не ЗначениеЗаполнено(ФильтрДереваШагов) Тогда
		Возврат;
	КонецЕсли;	 
	
	ДеревоФормыСтроки = ДеревоШагов.ПолучитьЭлементы();
	РазвернутьСтрокиДерева(ДеревоФормыСтроки);
КонецПроцедуры


&НаСервере
Функция СоздатьFeatureReader(КаталогИнструментов, ДвДанныеvbFeatureReader, ВременноеИмяФайла)
	ФайлvbFeatureReader = Новый Файл(КаталогИнструментов + "\lib\FeatureReader\vbFeatureReader.epf");
	ВременноеИмяФайла = Неопределено;
	Если Не ФайлvbFeatureReader.Существует() Тогда
		ВременноеИмяФайла = ПолучитьИмяВременногоФайла("epf");
		ДвДанныеvbFeatureReader.Записать(ВременноеИмяФайла);
		FeatureReader = ВнешниеОбработки.Создать(ВременноеИмяФайла, Ложь);
	Иначе	
		FeatureReader = ВнешниеОбработки.Создать(ФайлvbFeatureReader.ПолноеИмя, Ложь);
	КонецЕсли;	 
	
	Возврат FeatureReader;
КонецФункции	

&НаСервере
Функция УбратьЛишиниеСимволыИзТекста(Знач Стр)
	Стр = СтрЗаменить(Стр,Символы.Таб," ");
	Пока Найти(Стр,"  ") > 0 Цикл
		Стр = СтрЗаменить(Стр,"  "," ");
	КонецЦикла;	
	
	Возврат Стр;
КонецФункции	

&НаСервере
Процедура ДобавитьЗначенияВТаблицуДляПереодаРекурсивно(ТаблицаДляПереводаИзвестныхШагов,Дерево)
	Для Каждого СтрокаДерева Из Дерево.Строки Цикл
		Если СтрокаДерева.Язык = "ru" Тогда
			Если ЗначениеЗаполнено(СтрокаДерева.ТипШага) Тогда
				СтрокаТаблицаДляПереводаИзвестныхШагов = ТаблицаДляПереводаИзвестныхШагов.Найти(СтрокаДерева.ТипШага,"ОригиналРусскийШаг");
				Если СтрокаТаблицаДляПереводаИзвестныхШагов = Неопределено Тогда
					СтрокаТаблицаДляПереводаИзвестныхШагов = ТаблицаДляПереводаИзвестныхШагов.Добавить();
					СтрокаТаблицаДляПереводаИзвестныхШагов.ОригиналРусскийШаг          = СтрокаДерева.ТипШага;
					СтрокаТаблицаДляПереводаИзвестныхШагов.ОригиналРусскийОписаниеШага = "Категория шагов";
				КонецЕсли;	 
			Иначе
				СтрокаТаблицаДляПереводаИзвестныхШагов = ТаблицаДляПереводаИзвестныхШагов.Найти(СтрокаДерева.ПредставлениеТеста,"ОригиналРусскийШаг");
				Если СтрокаТаблицаДляПереводаИзвестныхШагов = Неопределено Тогда
					СтрокаТаблицаДляПереводаИзвестныхШагов = ТаблицаДляПереводаИзвестныхШагов.Добавить();
					СтрокаТаблицаДляПереводаИзвестныхШагов.ОригиналРусскийШаг          = УбратьЛишиниеСимволыИзТекста(СтрокаДерева.ПредставлениеТеста);
					СтрокаТаблицаДляПереводаИзвестныхШагов.ОригиналРусскийОписаниеШага = СтрокаДерева.ОписаниеШага;
				КонецЕсли;	 
			КонецЕсли;	
		КонецЕсли;	 
		
		ДобавитьЗначенияВТаблицуДляПереодаРекурсивно(ТаблицаДляПереводаИзвестныхШагов,СтрокаДерева);
	КонецЦикла;	
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьТаблицуДляПеревода(ТаблицаДляПереводаИзвестныхШагов,Дерево)
	ДобавитьЗначенияВТаблицуДляПереодаРекурсивно(ТаблицаДляПереводаИзвестныхШагов,Дерево);
КонецПроцедуры

&НаСервере
Функция ПоказатьПереводТекстаGherkin(ДанныеПеревода)
	ДеревоСервер = РеквизитФормыВЗначение("ДеревоШагов");
	
	ТаблицаДляПереводаИзвестныхШагов = Новый ТаблицаЗначений;
	ТаблицаДляПереводаИзвестныхШагов.Колонки.Добавить("ОригиналРусскийШаг");
	ТаблицаДляПереводаИзвестныхШагов.Колонки.Добавить("ОригиналРусскийОписаниеШага");
	ТаблицаДляПереводаИзвестныхШагов.Колонки.Добавить("Перевод");
	
	
	ЗаполнитьТаблицуДляПеревода(ТаблицаДляПереводаИзвестныхШагов,ДеревоСервер);
	
	ДанныеПеревода.Вставить("ТаблицаДляПереводаИзвестныхШагов",ТаблицаДляПереводаИзвестныхШагов);
	ДанныеПеревода.Вставить("МакетШаблонПеревода",МакетШаблонПеревода);
	
	
	ТаблицаИзвестныхStepDefinitionСервер = РеквизитФормыВЗначение("ТаблицаИзвестныхStepDefinition");
	ДанныеПеревода.Вставить("ТаблицаИзвестныхStepDefinition",ТаблицаИзвестныхStepDefinitionСервер);
	
	
	
	ДвДанныеvbFeatureReader = Неопределено;
	ВременноеИмяФайла = Неопределено;
	FeatureReader = СоздатьFeatureReader(КаталогИнструментов, ДвДанныеvbFeatureReader, ВременноеИмяФайла);
	
	FeatureReader.ПолучитьПереводТекстаGherkin(ДанныеПеревода);
	ДанныеПеревода.Вставить("ТаблицаПеревода",Неопределено);
	
	ДанныеПеревода.Вставить("ТаблицаДляПереводаИзвестныхШагов",Неопределено);
	
	ТабДок         = ДанныеПеревода.ТабДок;
	ДанныеПеревода = Неопределено;
	
	Возврат ТабДок;
КонецФункции	

&НаСервере
Функция ПолучитьДвоичныеДанныеФайлПереводаСервер()
	Возврат ЗначениеИзСтрокиВнутр(ДвоичныеДанныеФайлПеревода);
КонецФункции	

&НаКлиенте
Процедура ПоказатьПеревод(Команда)
	
	ДанныеПеревода = Новый Структура;
	ДанныеПеревода.Вставить("ЯзыкПеревода",ЯзыкГенератораGherkin);
	
	ДанныеПеревода.Вставить("ДвоичныеДанныеФайлПеревода",ПолучитьДвоичныеДанныеФайлПереводаСервер());
	ДанныеПеревода.Вставить("ФормированиеТаблицыДляДальнейшегоПеревода",Истина);
	
	ТабДок = ПоказатьПереводТекстаGherkin(ДанныеПеревода);
	ТабДок.Показать();
КонецПроцедуры


&НаКлиенте
Процедура НайтиШагиОчистка(Элемент, СтандартнаяОбработка)
КонецПроцедуры


&НаСервере
Функция ПодготовитьТаблицуДляВыгрузкиШагов()
	ДеревоШаговСервер                    = РеквизитФормыВЗначение("ДеревоШагов");
	ТаблицаИзвестныхStepDefinitionСервер = РеквизитФормыВЗначение("ТаблицаИзвестныхStepDefinition");
	
	Массив = Новый Массив;
	
	Для Каждого СтрокаТаблицаИзвестныхStepDefinitionСервер Из ТаблицаИзвестныхStepDefinitionСервер Цикл
		Если НЕ ЗначениеЗаполнено(СтрокаТаблицаИзвестныхStepDefinitionСервер.ПредставлениеТеста) Тогда
			Продолжить;
		КонецЕсли;	 
		
		СтрокаДерева = ДеревоШаговСервер.Строки.Найти(СтрокаТаблицаИзвестныхStepDefinitionСервер.ПредставлениеТеста,"ПредставлениеТеста",Истина);
		Если СтрокаДерева = Неопределено Тогда
			Продолжить;
		КонецЕсли;	 
		
		Структура = Новый Структура;
		Структура.Вставить("ИмяШага",СтрокаТаблицаИзвестныхStepDefinitionСервер.ПредставлениеТеста);
		Структура.Вставить("ОписаниеШага",СтрокаТаблицаИзвестныхStepDefinitionСервер.ОписаниеШага);
		Структура.Вставить("ПолныйТипШага",СтрокаДерева.Родитель.ПолныйТипШага);
		
		Массив.Добавить(Структура);
	КонецЦикла;	
	
	Возврат Массив;
КонецФункции	

&НаКлиенте
Процедура ВыгрузитьШагиВJSONВыборФайлаЗавершение(ВыбранныеФайлы, ДополнительныеПараметры) Экспорт
	
	Если НЕ ЗначениеЗаполнено(ВыбранныеФайлы) Тогда
		Возврат;
	КонецЕсли;	 
	
	МассивДляВыгрузкиШагов = ПодготовитьТаблицуДляВыгрузкиШагов();
	
	
	ЗаписьJSON = Вычислить("Новый ЗаписьJSON");
	
	
	ЗаписьJSON.ОткрытьФайл(ВыбранныеФайлы[0]);
	
	ЗаписьJSON.ЗаписатьНачалоМассива();
	
	Для Каждого ШагДляВыгрузки Из МассивДляВыгрузкиШагов Цикл
		ЗаписьJSON.ЗаписатьНачалоОбъекта();
		
		
		Для Каждого СвойстваШага Из ШагДляВыгрузки Цикл
			ЗаписьJSON.ЗаписатьИмяСвойства(СвойстваШага.Ключ);
			ЗаписьJSON.ЗаписатьЗначение(СвойстваШага.Значение);
		КонецЦикла;	
		
		ЗаписьJSON.ЗаписатьКонецОбъекта();
	КонецЦикла;	
	
	
	ЗаписьJSON.ЗаписатьКонецМассива();
	
	ЗаписьJSON.Закрыть();
КонецПроцедуры

&НаКлиенте
Процедура ВыгрузитьШагиВJSON(Команда)
	ДиалогВыбораКаталога = Новый ДиалогВыбораФайла(РежимДиалогаВыбораФайла.Сохранение);
	ДиалогВыбораКаталога.МножественныйВыбор = Ложь;
	ДиалогВыбораКаталога.Фильтр = "(*.json)|*.json";
	ДиалогВыбораКаталога.Показать(Вычислить("Новый ОписаниеОповещения(""ВыгрузитьШагиВJSONВыборФайлаЗавершение"", ЭтаФорма)"));
КонецПроцедуры

