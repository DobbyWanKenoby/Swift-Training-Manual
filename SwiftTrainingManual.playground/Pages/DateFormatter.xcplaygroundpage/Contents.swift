/*:
 [Оглавление](HEADER)
 # DateFormatter
 
 - Используется для форматирования дат и перевода значений типа Date в String и обратно.
 */
import Foundation
//: ## Базовые возможности
//: __Создание форматтера__
var formatter = DateFormatter()
//: __Быстрая сменя стиля даты и времени__
// Дата
formatter.dateStyle = .short // "7/14/21"
formatter.dateStyle = .full // "Wednesday, July 14, 2021"
formatter.dateStyle = .long // "July 14, 2021"
formatter.dateStyle = .medium // "Jul 14, 2021"
//formatter.dateStyle = .none // ""
// Время
formatter.timeStyle = .full // "8:23:22 PM Moscow Standard Time"
formatter.timeStyle = .long // "8:23:35 PM GMT+3"
formatter.timeStyle = .medium // "8:23:45 PM"
formatter.timeStyle = .short // "8:23 PM"
//formatter.timeStyle = .none // ""
// Смена символа "До полудня" / "После полудня"
formatter.pmSymbol = "pm"
formatter.amSymbol = "am"

//: __Установка произвольного формата даты__ .Свойство dateFormat используется как при переводе Date в String, так и обратно

formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
// итоговая дата будет иметь формат "2021-07-14T21:04:39+03:00" при переводе в строку

//: __Перевод даты в строку и обратно__
let dateString = formatter.string(from: Date())
// Свойство dateFormat должно иметь соответсвующее формату даты значение
// В таком случае преобразование будет произведено корректно
let dateFromString = formatter.date(from: dateString)

//: __Изменение временного пояса__
formatter.timeZone = TimeZone(abbreviation: "GMT+4")


