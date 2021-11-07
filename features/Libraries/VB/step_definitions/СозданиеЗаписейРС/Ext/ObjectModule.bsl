﻿//начало текста модуля

Перем Ванесса;
 


Функция ДобавитьШагВМассивТестов(МассивТестов,Снипет,ИмяПроцедуры,ПредставлениеТеста = Неопределено,Транзакция = Неопределено,Параметр = Неопределено)
	Структура = Новый Структура;
	Структура.Вставить("Снипет",Снипет);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ИмяПроцедуры",ИмяПроцедуры);
	Структура.Вставить("ПредставлениеТеста",ПредставлениеТеста);
	Структура.Вставить("Транзакция",Транзакция);
	Структура.Вставить("Параметр",Параметр);
	МассивТестов.Добавить(Структура);
КонецФункции


// Делает отключение модуля
&НаКлиенте
Функция ОтключениеМодуля() Экспорт

	Ванесса = Неопределено;
	Контекст = Неопределено;
	КонтекстСохраняемый = Неопределено;

КонецФункции

Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	ДобавитьШагВМассивТестов(ВсеТесты,"ВМетаданныхЕстьРегистрСведений(Парам01)","ВМетаданныхЕстьРегистрСведений","Когда в метаданных есть РегистрСведений ""РегистрСведений1""");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯУдаляюВсеЗаписиРегистрСведений(Парам01)","ЯУдаляюВсеЗаписиРегистрСведений","И я удаляю все записи РегистрСведений ""РегистрСведений1""");
	ДобавитьШагВМассивТестов(ВсеТесты,"ВБазеНетЗаписейРегистрСведений(Парам01)","ВБазеНетЗаписейРегистрСведений","И в базе нет записей РегистрСведений ""РегистрСведений1""");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯСоздалFixtureРегистрСведенийПоМакету(Парам01)","ЯСоздалFixtureРегистрСведенийПоМакету","И я создал  fixture РегистрСведений по макету ""Макет""");
	ДобавитьШагВМассивТестов(ВсеТесты,"ВБазеПоявилсяХотяБыОднаЗаписьРегистрСведений(Парам01)","ВБазеПоявилсяХотяБыОднаЗаписьРегистрСведений","Тогда В базе появился хотя бы одна запись РегистрСведений ""РегистрСведений1""");

	Возврат ВсеТесты;
КонецФункции


Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры


Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



Функция ВМетаданныхЕстьРССервер(ВидРС)
	Нашел = Ложь;
	Для каждого Элем Из Метаданные.РегистрыСведений Цикл
		Имя = Элем.Имя;
		Если НРег(Имя) = НРег(ВидРС) Тогда
			Нашел = Истина;
			Прервать;
		КонецЕсли;	 
	КонецЦикла;
	
	Возврат Нашел; 
КонецФункции	



//Когда в метаданных есть РегистрСведений "РегистрСведений1"
//@ВМетаданныхЕстьРегистрСведений(Парам01)
Процедура ВМетаданныхЕстьРегистрСведений(ВидРС) Экспорт
	Нашел = ВМетаданныхЕстьРССервер(ВидРС);
	
	Ванесса.ПроверитьРавенство(Нашел,Истина,"В метаданных есть вид РС " + ВидРС);
КонецПроцедуры



Процедура ЯУдаляюВсеЗаписиРС(ВидРС)
	НаборЗаписей = РегистрыСведений[ВидРС].СоздатьНаборЗаписей();
	НаборЗаписей.Записать();
КонецПроцедуры


//И я удаляю все записи РегистрСведений "РегистрСведений1"
//@ЯУдаляюВсеЗаписиРегистрСведений(Парам01)
Процедура ЯУдаляюВсеЗаписиРегистрСведений(ВидРС) Экспорт
	ЯУдаляюВсеЗаписиРС(ВидРС);
КонецПроцедуры



Функция ВБазеНетЗаписейРССервер(ВидРС)
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	КОЛИЧЕСТВО(РегистрСведений1.Измерение1) КАК КолЭлементов
		|ИЗ
		|	РегистрСведений.РегистрСведений1 КАК РегистрСведений1";

	Запрос.Текст = СтрЗаменить(Запрос.Текст,"РегистрСведений1",ВидРС);	
	Результат = Запрос.Выполнить();

	ВыборкаДетальныеЗаписи = Результат.Выбрать();
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		Возврат ВыборкаДетальныеЗаписи.КолЭлементов;
	КонецЦикла;
КонецФункции	


//И в базе нет записей РегистрСведений "РегистрСведений1"
//@ВБазеНетЗаписейРегистрСведений(Парам01)
Процедура ВБазеНетЗаписейРегистрСведений(ВидРС) Экспорт
	КолЭлементов = ВБазеНетЗаписейРССервер(ВидРС);
	Ванесса.ПроверитьРавенство(КолЭлементов,0,"Не должно быть записей");
КонецПроцедуры





Функция ПолучитьМакетСервер(Имямакета)
	Возврат ПолучитьМакет(Имямакета);
КонецФункции	



//И я создал  fixture РегистрСведений по макету "Макет"
//@ЯСоздалFixtureРегистрСведенийПоМакету(Парам01)
Процедура ЯСоздалFixtureРегистрСведенийПоМакету(ИмяМакета) Экспорт
	Макет = ПолучитьМакетСервер(ИмяМакета);
	СтруктураДанных = Ванесса.СоздатьДанныеПоТабличномуДокументу(Макет);
	Ванесса.ПроверитьНеРавенство(СтруктураДанных,Неопределено,"Получили структуру данных.");
КонецПроцедуры



Функция ВБазеПоявилсяХотяБыОднаЗаписьРССервер(ВидРС)
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	КОЛИЧЕСТВО(РегистрСведений1.Измерение1) КАК КолЭлементов
		|ИЗ
		|	РегистрСведений.РегистрСведений1 КАК РегистрСведений1";

	Запрос.Текст = СтрЗаменить(Запрос.Текст,"РегистрСведений1",ВидРС);	
	Результат = Запрос.Выполнить();

	ВыборкаДетальныеЗаписи = Результат.Выбрать();

	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		Возврат ВыборкаДетальныеЗаписи.КолЭлементов;
	КонецЦикла;
КонецФункции	


//В базе появился хотя бы один элемент справочника "Справочник1"
//@ВБазеПоявилсяХотяБыОдинЭлементСправочника(Парам01Строка)
Процедура ВБазеПоявилсяХотяБыОднаЗаписьРегистрСведений(ВидРС) Экспорт
	КолЭлементов = ВБазеПоявилсяХотяБыОднаЗаписьРССервер(ВидРС);
	Ванесса.ПроверитьНеРавенство(КолЭлементов,0,"В базе должны быть записи");
КонецПроцедуры


//окончание текста модуля

  