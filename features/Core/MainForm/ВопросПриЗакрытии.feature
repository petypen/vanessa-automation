﻿# language: ru
# encoding: utf-8
#parent uf:
@UF10_Запуск_VA
#parent ua:
@UA35_запускать_интерактивно

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOnWeb
@IgnoreOn836
@IgnoreOn837
@IgnoreOn838
@IgnoreOn839
@tree

Функционал: Проверка появления вопроса при закрытии формы
 
Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Проверка появления вопроса при закрытии формы
	И В командном интерфейсе я выбираю 'Основная' 'Открыть vanessa automation без режима самотестирования'
	Тогда открылось окно '*Vanessa Automation*'
	И я нажимаю на кнопку с именем 'ФормаРазвернутьВсеГруппыВНастройках'
	И Пауза 1
		
	И я перехожу к закладке с именем "ГруппаНастройки"
	И из выпадающего списка с именем "ЗапрашиватьПодтверждениеПриЗакрытии" я выбираю точное значение 'Да'
	И Я закрываю окно '*Vanessa Automation*'
	Тогда открылось окно '1С:Предприятие'
	И я нажимаю на кнопку 'Закрыть форму'
	И я жду закрытия окна "*Vanessa Automation*" в течение 20 секунд