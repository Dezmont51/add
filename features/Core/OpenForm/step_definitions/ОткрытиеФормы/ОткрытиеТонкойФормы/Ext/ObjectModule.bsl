﻿Перем Ванесса;

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

Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯРаботаюСVanessa_behaviorepf()","ЯРаботаюСVanessa_behaviorepf","я работаю с bddRunner.epf");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯМогуОткрытьФормуОбработки()","ЯМогуОткрытьФормуОбработки","я могу открыть форму обработки");
	ДобавитьШагВМассивТестов(ВсеТесты,"ЯМогуЗакрытьФормуОбработки()","ЯМогуЗакрытьФормуОбработки","я могу закрыть форму обработки");

	Возврат ВсеТесты;
КонецФункции

Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры


//я работаю с bddRunner.epf
//@ЯРаботаюСVanessa_behaviorepf()
Процедура ЯРаботаюСVanessa_behaviorepf() Экспорт
	ПутьКОбработке = Ванесса.ИспользуемоеИмяФайла;
	НовыйЭкземпляр = ВнешниеОбработки.Создать(ПутьКОбработке);
	НовыйЭкземпляр.РежимСамотестирования = Истина;
	
	
	Форма = НовыйЭкземпляр.ПолучитьФорму("Форма");
	Ванесса.ПроверитьРавенство(Форма.Открыта(),Ложь,"Мы должны были получить новый экземпляр формы.");
	Контекст.Вставить("ОткрытаяФормаVanessaBehavoir",Форма);
КонецПроцедуры

//я могу открыть форму обработки
//@ЯМогуОткрытьФормуОбработки()
Процедура ЯМогуОткрытьФормуОбработки() Экспорт
	ОткрытаяФормаVanessaBehavoir = Контекст.ОткрытаяФормаVanessaBehavoir;
	ОткрытаяФормаVanessaBehavoir.Открыть();
	
	Ванесса.ПроверитьРавенство(ОткрытаяФормаVanessaBehavoir.Открыта(),Истина,"Форма vanessa-behavoir открылась.");
КонецПроцедуры

//я могу закрыть форму обработки
//@ЯМогуЗакрытьФормуОбработки()
Процедура ЯМогуЗакрытьФормуОбработки() Экспорт
	ОткрытаяФормаVanessaBehavoir = Контекст.ОткрытаяФормаVanessaBehavoir;
	ОткрытаяФормаVanessaBehavoir.Закрыть();
	
	Ванесса.ПроверитьРавенство(ОткрытаяФормаVanessaBehavoir.Открыта(),Ложь,"Форма vanessa-behavoir закрылась.");
КонецПроцедуры
  