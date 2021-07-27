/*:
 [Оглавление](HEADER)
 # UITesting
 
 Проведение UI тестов с помощью фреймворка UITest
 
 В процессе тестирования можно использовать lldb, чтобы искать элементы и тестировать методы, например
 
 - po app - выведет структуру XCUIApplication
 - app.buttons["Add"].tap() - произведет тап по кнопке
 
 Для этого можем поставить брейкпоинт в требуемом тесте и начать вводить команды
 
 */

import Foundation
import XCTest

//: ### Подготовка к тестированию
/*:
 - Создание нового таргета типа UI Testing Bundle
 - Создание нового класса-потомка XCTestCase (при необходимости, так как он создается автоматически)
 - Все методы-тесты должны начинаться со слова test
 
 __Включение скриншотов (для успешных или неуспешных тестов)__
 - Edit Scheme
 - Test
 - Options
 - Пункты Capture screenshots и Delete when each test successed
 */



// Точка входа для UITesting - специальный прокси
let app = XCUIApplication()
app.launch()

//: ### Тестирование

// Теперь можно манупулировать с app

//: __Получение элементов__
app.navigationBars
app.buttons
app.buttons["some indentifier"] // кнопка с идентификатором
app.alerts
app.textFields
app.cells // ячейки таблиц
app.staticTexts // статический текст
app.staticTexts["some text here"]

//: __Действия с элементами__
app.buttons["some indentifier"].tap() // щелчек по элементу
app.textFields["placeholder or text"].tap()
app.textFields["placeholder or text"].typeText("enter this text") // ввод текст в текстовое поле

//: __Проверка существования элемента__
XCTAssertt(app.staticTexts["some text here"]).exists

//: ### Результаты тестирования
/*:
 Можно просмотреть результаты тестирования
 - Запустите тест и дождитесь его выполнения
 - ПКМ на значке запуска теста
 - Jump to Report
 */
