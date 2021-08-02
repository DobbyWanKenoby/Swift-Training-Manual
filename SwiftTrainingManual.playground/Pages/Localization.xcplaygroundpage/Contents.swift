/*:
 [Оглавление](HEADER)
 # Локализация приложения
 
 */

import Foundation

/*:
 ### Локализация строкового контента
 
 Для локализации текста в проекте необходимо выполнить следующие действия:
 - Создать файл Localizable.strings
 - Выделить файл и на правой панели нажать Localize
 - Перейти к настройкам проекта, раздел Info, подраздел Localizations и с помощью кнопку + добавить необходимые языки
 
 __Формат файла Localization.string__
 
 */
 "key" = "value";
 "anotherKey" = "value"
// можно использовать подстановку значений
// вместо %d будет подставлено число
"key %d" = "value %d";
/*:
 
 __Использование значений из файла Localization.string__
 
 Вместо конкретного текстового значения пишем
 */
NSLocalizedString("key", comment: "")
// если нужно подставить некоторые данные
String(format: NSLocalizedString("key %@", comment: ""), 54)

/*:
 ### Локализация Storyboard
 
 ....
 
 ### Локализация данных из Info.plist
 С помощью этой функции можно локализовать название приложения, текст всплывающих запросов на доступ к ресурсам устройства (локации, камере и т.д.) и др.
 
 - Необходимо создать файл InfoPlist.string
 - В файле прописать значения для параметров из файла Info.plist
 */
// для локализации названия
"CFBundleDisplayName" = "Localizated title of app";
// для локализации запроса на доступ к локации
"NSLocationWhenInUseUsageDescription" = "Description"

/*:
 ### Интернационализация
 
 __Числа__
*/
let quantity = NumberFormatter.localizedString(from: 5000, number: .decimal)
print(String.localizedStringWithFormat("some key of Licalizable.strings", quantity))
/*:
 __Валюта__
*/
let price = 149.95 as NSNumber
let formatter = NumberFormatter()
formatter.numberStyle = .currency
formatter.currencyCode = "EUR"
formatter.locale = Locale.current
formatter.string(from: price)
