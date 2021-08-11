/*:
 [Оглавление](HEADER)
 # Локализация приложения
 
 */

import Foundation

// текущая локаль
Locale.current // en_US
// требуемая локаль
Locale.init(identifier: "ru_RU") // ru_RU

// доступные локали
Locale.availableIdentifiers

// Возвращаем строку в соответствии с текущей локалью
let quantity = NumberFormatter.localizedString(from: 5000, number: .decimal) // 5,000

// создаем форматтер
var numFormatter = NumberFormatter()
// указываем стиль интернационализации чисел
numFormatter.numberStyle = .decimal
// указываем значение
let value: NSNumber = 5000

// проверяем текущую локаль
numFormatter.locale // en_US
numFormatter.string(from: value) // 5,000

// изменяем локаль
numFormatter.locale = Locale.init(identifier: "ru_RU")
numFormatter.string(from: value) // 5 000

// Валюта
// исходное значение
let price: NSNumber = 149.95
// создаем форматтер
let formatter = NumberFormatter()
// настраиваем форматтер
formatter.numberStyle = .currency
formatter.currencyCode = "EUR"

formatter.locale = Locale.current // ru_EN
formatter.string(from: price) // "€149.95"

formatter.locale = Locale.init(identifier: "ru_RU")
formatter.string(from: price) // ""149,95 €""

// Даты
// получение даты в текущей локале и указанном формате
let date = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)

// создаем форматтер
let dateFormatter = DateFormatter()
// настраиваем форматтер
dateFormatter.dateStyle = .full
dateFormatter.timeStyle = .medium
// указываем локаль
dateFormatter.locale = Locale.init(identifier: "ru")
// указываем часовой пояс
dateFormatter.timeZone = TimeZone(identifier: "GMT+6")
dateFormatter.string(from: Date()) // "воскресенье, 8 августа 2021 г. в 16:05:15"
// итоговое время на 3 часа больше московского
