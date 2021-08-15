# Строковые типы данных

В Swift активно используются следующие типы данных:

- String
- Character

## String

#### Инициализация

```swift
let string = "some text"
let string = String("some text")
```

#### Операции со значениями

##### Конкатенация

```swift
let number = 14.2
let string = "Angle is \(number)"
```

#### Форматироватирование значение

Инициализатор `String(format:_:)` позволяет отформатировать строку необходимым образом.

##### Определенное количество знаков после запятой

```swift
let rawValue = 123.456
let textNumber = String(format: "%.2f", rawValue) // 123.46
```