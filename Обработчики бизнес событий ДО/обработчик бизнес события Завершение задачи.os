// обработчик бизнес-события 
ЧислоВхождений = СтрЧислоВхождений(Задача.Наименование, "Прекрепить скан подписанного договора");
	Если ЧислоВхождений <> 0 Тогда
		// получаем предметы по задаче
		ТабЗначПредметыЗадачи = Мультипредметность.ПолучитьПредметыЗадачи(Задача);
		// отбираем предмет с типом Внутренний документ
		ВнДокПредметЗадачи = Неопределено;
		Если ТабЗначПредметыЗадачи.Количество() <> 0 Тогда
			Для Каждого СтрокаТЗПредметЗадачи ИЗ ТабЗначПредметыЗадачи Цикл
				Если ТипЗнч(СтрокаТЗПредметЗадачи.Предмет) = Тип("СправочникСсылка.ВнутренниеДокументы") Тогда
					ВнДокПредметЗадачи = СтрокаТЗПредметЗадачи.Предмет;
					Прервать;
					
				КонецЕсли;
			КонецЦикла;
		КонецЕсли;
		
		Если ВнДокПредметЗадачи = Неопределено Тогда
			Возврат;
		КонецЕсли;
		
		// устанавливаем состояние документа в "подписан"
		Делопроизводство.ЗаписатьСостояниеДокумента(ВнДокПредметЗадачи, ТекущаяДата(),Перечисления.СостоянияДокументов.Подписан, Задача.Исполнитель);
		
		//СсылкаНашаОрганизация = Справочники.Организации.НайтиПоКоду("00-000001");
		//ОбъектПредметЗадачи = ВнДокПредметЗадачи.ПолучитьОбъект();
		//Для Каждого СтрокаТЧ ИЗ ОбъектПредметЗадачи.Стороны Цикл
		//	Если СтрокаТЧ.Сторона <> СсылкаНашаОрганизация Тогда
		//		СтрокаТЧ.Подписан = Истина;
		//		СтрокаТЧ.Установил = Задача.Исполнитель;
		//		
		//	КонецЕсли;
		//КонецЦикла;
		//
		//ОбъектПредметЗадачи.Записать();
