﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;


&НаКлиенте
Перем ТекКолТаймер,МаксКолТаймер;

// Делает отключение модуля
&НаКлиенте
Функция ОтключениеМодуля() Экспорт

	Ванесса = Неопределено;
	Контекст = Неопределено;
	КонтекстСохраняемый = Неопределено;

КонецФункции

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯУбедилсяЧтоСлужебныйEPFДляПроверкиГенерацииEPFУдален()","ЯУбедилсяЧтоСлужебныйEPFДляПроверкиГенерацииEPFУдален","Дано Я убедился что служебный EPF для проверки генерации EPF удален");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВКаталогеПоявиласьОбработка(Парам01)","ВКаталогеПоявиласьОбработка","И     В каталоге появилась обработка ""Support\Instructions\Core\step_definitions\ДляГенерацииEPF.epf""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗапускаюКонфигураторСлужебнойБазы()","ЯЗапускаюКонфигураторСлужебнойБазы","Тогда я запускаю конфигуратор служебной базы");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПерехожуВСеанс1СTestClient()","ЯПерехожуВСеанс1СTestClient","И я перехожу в сеанс 1С TestClient");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрываюFeatureФайлВРедакторе()","ЯОткрываюFeatureФайлВРедакторе","И я открываю feature файл в редакторе");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯУдаляюСтрокуКотораяСодержитТекст(Парам01)","ЯУдаляюСтрокуКотораяСодержитТекст","И я удаляю строку которая содержит текст ""Тогда я получу сумму 15""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯДобавляюСтрокуТекста(Парам01)","ЯДобавляюСтрокуТекста","И я добавляю строку текста ""	Тогда сумма будет меньше 20""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯДобавляюСтроку(Парам01)","ЯДобавляюСтроку","И я добавляю строку ""	Тогда сумма будет меньше 20""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПишу(Парам01)","ЯПишу","И я пишу ""	Тогда сумма будет меньше 20""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСохраняюИзмененияВФайле()","ЯСохраняюИзмененияВФайле","И я сохраняю изменения в файле");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗакрываюТекстовыйРедактор()","ЯЗакрываюТекстовыйРедактор","и я закрываю текстовый редактор");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЖдуОкончанияОбработкиПерегенерацииEPF()","ЯЖдуОкончанияОбработкиПерегенерацииEPF","И я жду окончания обработки перегенерации EPF");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПерехожуВКонфигураторСлужебнойБазы()","ЯПерехожуВКонфигураторСлужебнойБазы","И я перехожу в конфигуратор служебной базы");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗакрываюОбработкуОткрытуюВКонфигураторе()","ЯЗакрываюОбработкуОткрытуюВКонфигураторе","И я закрываю обработку открытую в конфигураторе");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯОткрываюВКонфигуратореФайл(Парам01)","ЯОткрываюВКонфигуратореФайл","И я открываю в конфигураторе файл ""Support\Instructions\Core\step_definitions\ДляГенерацииEPF.epf""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯВДиалогеОткрытияФайловКонфигуратораУказываю(Парам01)(Парам01)","ЯВДиалогеОткрытияФайловКонфигуратораУказываю(Парам01)","Когда я в диалоге открытия файлов конфигуратора указываю ""ИмяФайла""");
	
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВКонфигуратореЯОткрываюОсновнуюФормуОбработки()","ВКонфигуратореЯОткрываюОсновнуюФормуОбработки","И в конфигураторе я открываю основную форму обработки");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПерехожуНаЗакладкуМодуль()","ЯПерехожуНаЗакладкуМодуль","И я перехожу на закладку Модуль");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСворачиваюОбластьСлужебныеФункции()","ЯСворачиваюОбластьСлужебныеФункции","И я сворачиваю область Служебные функции");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПерехожуКПроцедуре(Парам01)","ЯПерехожуКПроцедуре","И я перехожу к процедуре ""ТогдаСуммаБудетМеньше""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯВыделяюВТекстеСтрок(Парам01)","ЯВыделяюВТекстеСтрок","И я выделяю в тексте 3 строк");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯЗакрываюКонфигураторСлужебнойБазы()","ЯЗакрываюКонфигураторСлужебнойБазы","И я закрываю конфигуратор служебной базы");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	ИмяEPF = Контекст.ИмяEPF;
	Если Ванесса.ФайлСуществуетКомандаСистемы(ИмяEPF) Тогда
		Ванесса.УдалитьФайлыКомандаСистемы(ИмяEPF);
	КонецЕсли;	 
	
	
	//вернём в фиче строку как она была раньше
	
	ВременнаяФича = ПолучитьИмяВременногоФайла("feature");
	ЗТ = Новый ЗаписьТекста(ВременнаяФича,"UTF-8",,Ложь); 
	
	ИмяФичи = Ванесса.Объект.КаталогИнструментов + "\Features\Support\Instructions\Core\ДляГенерацииEPF.feature";
	Текст = Новый ЧтениеТекста;
	Текст.Открыть(ИмяФичи,"UTF-8");
	
	Пока Истина Цикл
		Стр = Текст.ПрочитатьСтроку();
		Если Стр = Неопределено Тогда
			Прервать;
		КонецЕсли;	 
		
		Стр = СтрЗаменить(Стр,"Тогда сумма будет меньше 20","Тогда я получу сумму 15");
		ЗТ.ЗаписатьСтроку(Стр); 
	КонецЦикла;	
	
	Текст.Закрыть();
	ЗТ.Закрыть();
	
	Ванесса.УдалитьФайлыКомандаСистемы(ИмяФичи);
	Ванесса.ПереместитьФайлКомандаСистемы(ВременнаяФича,ИмяФичи);
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////


&НаКлиенте
//Дано Я убедился что служебный EPF для проверки генерации EPF удален
//@ЯУбедилсяЧтоСлужебныйEPFДляПроверкиГенерацииEPFУдален()
Процедура ЯУбедилсяЧтоСлужебныйEPFДляПроверкиГенерацииEPFУдален() Экспорт
	ИмяEPF = Ванесса.Объект.КаталогИнструментов + "\features\Support\Instructions\Core\step_definitions\ДляГенерацииEPF.epf";
	Если Ванесса.ФайлСуществуетКомандаСистемы(ИмяEPF) Тогда
		Ванесса.УдалитьФайлыКомандаСистемы(ИмяEPF);
	КонецЕсли;	 
	
	Контекст.Вставить("ИмяEPF",ИмяEPF);
КонецПроцедуры

&НаКлиенте
Процедура Таймер() Экспорт
	ИмяОбработчика = "Таймер";
	
	Если НЕ Ванесса.ИдетВыполнениеСценариев() Тогда
		ОтключитьОбработчикОжидания(ИмяОбработчика);
		Возврат;
	КонецЕсли;	 
	
	ТекКолТаймер = ТекКолТаймер + 1;
	Если ТекКолТаймер > МаксКолТаймер Тогда
		ОтключитьОбработчикОжидания(ИмяОбработчика);
		ТекстСообщения = Ванесса.ПолучитьТекстСообщенияПользователю("Файл <%1> не найден.");
		ТекстСообщения = СтрЗаменить(ТекстСообщения,"%1",Контекст.ИмяEPF);
		ВызватьИсключение ТекстСообщения;
	КонецЕсли;	 
	
	Если Ванесса.ФайлСуществуетКомандаСистемы(Контекст.ИмяEPF) Тогда
		ОтключитьОбработчикОжидания(ИмяОбработчика);
		Ванесса.ПродолжитьВыполнениеШагов();
	КонецЕсли;	 
	
КонецПроцедуры

&НаКлиенте
//И     В каталоге появилась обработка "Support\Instructions\Core\step_definitions\ДляГенерацииEPF.epf"
//@ВКаталогеПоявиласьОбработка(Парам01)
Процедура ВКаталогеПоявиласьОбработка(Парам01) Экспорт
	ТекКолТаймер  = 0;
	МаксКолТаймер = 20;
	Ванесса.ЗапретитьВыполнениеШагов();
	ПодключитьОбработчикОжидания("Таймер",1,Ложь);
КонецПроцедуры

&НаКлиенте
//Тогда я запускаю конфигуратор служебной базы
//@ЯЗапускаюКонфигураторСлужебнойБазы()
Процедура ЯЗапускаюКонфигураторСлужебнойБазы() Экспорт
	Ванесса.СоздатьСлужебныеБазыЕслиИхНет();
	
	Ванесса.ЗапуститьСеансСлужебнойБазы("v83ServiceBase","Designer","");
	
	Ванесса.sleep(2);
	
	Статус = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\ConfiguratorIsOpen.sikuli""");
	Если Статус <> 0 Тогда
		ВызватьИсключение Ванесса.ПолучитьТекстСообщенияПользователю("Не смог найти открытый конфигуратор."); 
	КонецЕсли;	 
КонецПроцедуры

&НаКлиенте
//И я открываю в конфигураторе файл "Support\Instructions\Core\step_definitions\ДляГенерацииEPF.epf"
//@ЯОткрываюВКонфигуратореФайл(Парам01)
Процедура ЯОткрываюВКонфигуратореФайл(ИмяФайла) Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\OpenDialogConf.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <OpenDialogConf>");
	
	//Ванесса.СделатьДействияПриЗаписиИнструкции("толькоскриншот");
	
	Ванесса.Шаг("И я набираю текст ""#enter""");
	//Ванесса.sleep(2);
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\OpenDialogClick.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <OpenDialogClick>");
	
	Путь = Ванесса.Объект.КаталогИнструментов + "\Features\" + ИмяФайла;
	
	Ванесса.Шаг("И я набираю текст""" + Путь + """");
	
	Ванесса.СделатьДействияПриЗаписиИнструкции();
	Ванесса.Шаг("И я набираю текст ""#enter""");
	
КонецПроцедуры

&НаКлиенте
//Когда я в диалоге открытия файлов конфигуратора указываю "ИмяФайла"
//@ЯВДиалогеОткрытияФайловКонфигуратораУказываю(Парам01)
Процедура ЯВДиалогеОткрытияФайловКонфигуратораУказываю(ИмяФайла) Экспорт
	ЯОткрываюВКонфигуратореФайл(ИмяФайла);
КонецПроцедуры

&НаКлиенте
//И в конфигураторе я открываю основную форму обработки
//@ВКонфигуратореЯОткрываюОсновнуюФормуОбработки()
Процедура ВКонфигуратореЯОткрываюОсновнуюФормуОбработки() Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\OpenMainFormOfEPF.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <OpenMainFormOfEPF>");
КонецПроцедуры

&НаКлиенте
//И я перехожу на закладку Модуль
//@ЯПерехожуНаЗакладкуМодуль()
Процедура ЯПерехожуНаЗакладкуМодуль() Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\GoToFormModule.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <GoToFormModule>");
КонецПроцедуры

&НаКлиенте
//И я сворачиваю область Служебные функции
//@ЯСворачиваюОбластьСлужебныеФункции()
Процедура ЯСворачиваюОбластьСлужебныеФункции() Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\CollapseServiceArea.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <CollapseServiceArea>");
КонецПроцедуры

&НаКлиенте
//И я закрываю конфигуратор служебной базы
//@ЯЗакрываюКонфигураторСлужебнойБазы()
Процедура ЯЗакрываюКонфигураторСлужебнойБазы() Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\CloseConfigurator.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <CloseConfigurator>");
КонецПроцедуры

&НаКлиенте
//И я перехожу к процедуре "ЯУказалПервоеСлагаемое"
//@ЯПерехожуКПроцедуре(Парам01)
Процедура ЯПерехожуКПроцедуре(ИмяПроцедуры,Тип = "Процедура") Экспорт
	ИмяФайла = ПолучитьИмяВременногоФайла("txt");
	ЗТ = Новый ЗаписьТекста(ИмяФайла,"UTF-8",,Истина); 
	ЗТ.Записать(Тип + " " + ИмяПроцедуры); 
	ЗТ.Закрыть();
	
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\GoToProcedure.sikuli " + ИмяФайла);
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <GoToProcedure>");
КонецПроцедуры

&НаКлиенте
//И я выделяю в тексте 9 строк
//@ЯВыделяюВТекстеСтрок(Парам01)
Процедура ЯВыделяюВТекстеСтрок(КолСтрок) Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\SelectStringsInText.sikuli " + КолСтрок);
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <SelectStringsInText>");
КонецПроцедуры

&НаКлиенте
//И я перехожу в сеанс 1С TestClient
//@ЯПерехожуВСеанс1СTestClient()
Процедура ЯПерехожуВСеанс1СTestClient() Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\SwitchToTestClient.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <SwitchToTestClient>");
КонецПроцедуры

&НаКлиенте
//И я открываю feature файл в редакторе
//@ЯОткрываюFeatureФайлВРедакторе()
Процедура ЯОткрываюFeatureФайлВРедакторе() Экспорт
	Ванесса.Шаг("И     В открытой форме я перехожу к закладке ""Запуск сценариев""");
	
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\OpenFeatureFileInRedactor.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <OpenFeatureFileInRedactor>");
КонецПроцедуры

&НаКлиенте
//И я удаляю строку которая содержит текст "Тогда я получу сумму 15"
//@ЯУдаляюСтрокуКотораяСодержитТекст(Парам01)
Процедура ЯУдаляюСтрокуКотораяСодержитТекст(Стр) Экспорт
	ИмяФайла = ПолучитьИмяВременногоФайла("txt");
	ЗТ = Новый ЗаписьТекста(ИмяФайла,"UTF-8",,Истина); 
	ЗТ.Записать(Стр); 
	ЗТ.Закрыть();
	
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\DeleteLineWithText.sikuli " + ИмяФайла);
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <DeleteLineWithText>");
КонецПроцедуры

&НаКлиенте
//И я добавляю строку текста "Тогда сумма будет меньше 20"
//@ЯДобавляюСтрокуТекста(Парам01)
Процедура ЯДобавляюСтрокуТекста(Стр) Экспорт
	ИмяФайла = ПолучитьИмяВременногоФайла("txt");
	ЗТ = Новый ЗаписьТекста(ИмяФайла,"windows-1251",,Ложь); 
	ЗТ.ЗаписатьСтроку(Стр); 
	ЗТ.Закрыть();
	
	Ванесса.Шаг("И я эмулирую набор текста из файла """ + ИмяФайла + """");
	Ванесса.Шаг("И я набираю текст ""#enter""");
КонецПроцедуры

&НаКлиенте
//И я добавляю строку "Тогда сумма будет меньше 20"
//@ЯДобавляюСтроку(Парам01)
Процедура ЯДобавляюСтроку(Стр) Экспорт
	ЯДобавляюСтрокуТекста(Стр);
КонецПроцедуры

&НаКлиенте
//И я пишу "Тогда сумма будет меньше 20"
//@ЯДобавляюСтроку(Парам01)
Процедура ЯПишу(Стр) Экспорт
	Если Лев(НРег(Стр),СтрДлина("И я пишу")) = "и я пишу" Тогда
		Стр = Сред(Стр,СтрДлина("И я пишу")+1);
	КонецЕсли;	 
	ЯДобавляюСтрокуТекста(Стр);
КонецПроцедуры

&НаКлиенте
Процедура ТаймерEPFСгенерировалась() Экспорт
	ИмяОбработчика = "ТаймерEPFСгенерировалась";
	
	Если НЕ Ванесса.ИдетВыполнениеСценариев() Тогда
		ОтключитьОбработчикОжидания(ИмяОбработчика);
		Возврат;
	КонецЕсли;	 
	
	ТекКолТаймер = ТекКолТаймер + 1;
	Если ТекКолТаймер > МаксКолТаймер Тогда
		ОтключитьОбработчикОжидания(ИмяОбработчика);
		ВызватьИсключение Ванесса.ПолучитьТекстСообщенияПользователю("Не найден лог перегенерации EPF.");
	КонецЕсли;	 
	
	
	АктивноеОкно =Ванесса.ПолучитьАктивноеОкноИзТестовоеПриложение();
	Сообщения    = АктивноеОкно.ПолучитьТекстыСообщенийПользователю();
	Нашел        = Ложь;
	Для каждого Сообщение Из Сообщения Цикл
		Если Найти(НРег(Сообщение),НРег("Создание epf по фичам закончено.")) > 0 Тогда
			Нашел = Истина;
		КонецЕсли;	 
	КонецЦикла;
	
	Если Нашел Тогда
		ОтключитьОбработчикОжидания(ИмяОбработчика);
		Ванесса.ПродолжитьВыполнениеШагов();
	КонецЕсли;	 
КонецПроцедуры

&НаКлиенте
//И я жду окончания обработки перегенерации EPF
//@ЯЖдуОкончанияОбработкиПерегенерацииEPF()
Процедура ЯЖдуОкончанияОбработкиПерегенерацииEPF() Экспорт
	Ванесса.ЗапретитьВыполнениеШагов();
	
	ТекКолТаймер  = 0;
	МаксКолТаймер = 20;
	ПодключитьОбработчикОжидания("ТаймерEPFСгенерировалась",1);
КонецПроцедуры

&НаКлиенте
//И я перехожу в конфигуратор служебной базы
//@ЯПерехожуВКонфигураторСлужебнойБазы()
Процедура ЯПерехожуВКонфигураторСлужебнойБазы() Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\SwitchToConf.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <SwitchToConf>");
КонецПроцедуры

&НаКлиенте
//И я закрываю обработку открытую в конфигураторе
//@ЯЗакрываюОбработкуОткрытуюВКонфигураторе()
Процедура ЯЗакрываюОбработкуОткрытуюВКонфигураторе() Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\DoCtrlF4.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <DoCtrlF4>");
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\DoCtrlF4.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <DoCtrlF4>");
КонецПроцедуры

&НаКлиенте
//И я сохраняю изменения в файле
//@ЯСохраняюИзмененияВФайле()
Процедура ЯСохраняюИзмененияВФайле() Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\SaveChangesCtrls.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <SaveChangesCtrls>");
КонецПроцедуры

&НаКлиенте
//и я закрываю текстовый редактор
//@ЯЗакрываюТекстовыйРедактор()
Процедура ЯЗакрываюТекстовыйРедактор() Экспорт
	Результат = Ванесса.ВыполнитьSikuliСкрипт(Ванесса.Объект.КаталогИнструментов + "\tools\Sikuli\DoAltF4.sikuli");
	Ванесса.ПроверитьРавенство(Результат, 0 , "Произошло выполнение скрипта <DoAltF4>");
КонецПроцедуры
