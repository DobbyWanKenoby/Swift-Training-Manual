# Combine

[К оглавлению](./README.md)

## Содержание
- [Описание](#desc)
- [Использование Combine]()
	- [Использование `Subject/PassthroughSubject`]()
	- [Использование `@Published`]()
	- [Использование Notification Center]()
	- [Использование свойства `publisher`]()
	- [Операторы]()

## <a id="desc"></a>Описание

```import Combine```

__Combine__ - фреймворк от Apple, предоставляющий возможности реактивного программирования.

### Основные понятия  

__Publisher (Издатель)__ - объект, публикующий сообщения. Издатель может быть двух типов: `Publisher` и `Subject`. В первом случае Издатель самостоятельно публикует события, а во-втором для их публикации необходимо использовать метод `send`. 

__Operators (Операторы)__ - методы, модифицирующие события после их отправки Издателем и до принятия Подписчиком.

__Subscriber (Подписчик)__ - объект, получающий сообщения. Экземпляры подписчиков - это reference type.

__Sheduler (Планировщик)__ - объект, определяющий когда и как выполнить замыкание.

> ПРИМЕЧАНИЕ
>
> Обратите внимание, что и издатели и подписчики при их создании в коде, как и любые другие параметры, удаляются при выходе из зоны видимости. Поэтому при их использовании во view controller это необходимо учитывать и, например, хранить подписчика, как свойство самого вью контроллера.

## Использование Combine

### Использование `Subject/PassthroughSubject`

Класс `PassthroughSubject` позволяет создать издателя, который будет отправлять сообщения по вызову метода `send`.

**Шаг 1 - создание издателя**

```swift
// пример 1
let publisher = PassthroughSubject<Int, Error>()

// пример 2
lazy var stringChangePublisher = {
    PassthroughSubject<String?, Never>()
}()
```

Тип `PassthroughSubject` является универсальным (generic), внутри скобок указываются:

1. Тип сообщений, которые будет публиковать издатель.
2. Тип данных ошибок.


**Шаг 2 - создание подписчика**

```swift
// в данное свойству будут сохраняться экземпляры подписчиков
var subscriber: AnyCancellable

// пример 1
// изменение свойства text некой метки при публикации нового события типа String
subscriber: AnyCancellable = stringChangePublisher.map { $0 }.assign(to: \.text, on: someLabel)

// пример 2
// использовать метод sink
subscriber = stringChangePublisher.map{ $0 }.sink(receiveValue: { (text) in
    self.someLabel.text = text
})

// пример 3
// создаем подписчика с помощью перечисления Subscribers
let s = Subscribers.Assign(object: someLabel, keyPath: \.text)
// подписываем подписчика на издетеля
stringChangePublisher.receive(subscriber: s)
```

**Шаг 3 - публикация сообщения издателем**

В необходимом месте кода вызываем метод `send`, который доставляет сообщение до подписчиков.

```swift
textChangePublisher.send(sender.text)
```

### Использование `@Published`

Для создания издателя можно использовать обертку `@Publisher`, которая дополняет свойство соответствующей функциональностью.

**Шаг 1 - создание издателя**

```swift
@Published var isEnable: Bool = true
```

**Шаг 2 - создание подписчика**

> ПРИМЕЧАНИЕ
> 
> Доступ к подписчику производится с помощью префикса $. В ином случае будет произведен доступ к самому свойству.

```swift
// в данное свойству будут сохраняться экземпляры подписчиков
var subscriber: AnyCancellable

// пример 1
// включение/отключение некоторой кнопки при изменении значения isEnable
subscriber = $isEnable.assign(to: \.isEnabled, on: bt)

// пример 2
// использовать метод sink
subscriber = $isEnable.sink(receiveValue: { (text) in
    self.someLabel.text = text
})

// пример 3
// создаем подписчика с помощью перечисления Subscribers
let s = Subscribers.Assign(object: someLabel, keyPath: \.text)
// подписываем подписчика на издетеля
$isEnable.receive(subscriber: s)
```

**Шаг 3 - публикация сообщения издателем**

Теперь для публикации изменений достаточно просто изменить значение свойства `isEnable`.

### Использование свойства `NotificationCenter`

```swift
// Вариант 1

// Издатель, реагирующий на изменение текста в текстовом поле
let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: textField) 
```

```swift
// Вариант 2

// создание издателя, который будет отправлять нотификации "NotifyName"
let publisher = NotificationCenter.Publisher(.center, name: Notification.Name(rawValue: "NotifyName"), object: nil)
// теперь при необходимости можно отправить данную нотификацию, которую получат все подписанные на нее объекты
NotificationCenter.default.post(name: Notification.Name(rawValue: "NotifyName"), object: nil)
```

### Использование свойства `publisher`

Некоторые типы данных имеют встроенное свойство `publisher`, возвращающее Издателя

```swift
// Издатель, отпарвляющий новые элементы массива
let arrayPublisher = [1, 2, 3, 4, 5].publisher
```

Теперь при изменении значения исходного элемента, на основе которого создан Издатель, будут публиковаться сообщения.


## Операторы

### Создание Operator

В действительности Операторы также являются Издателями. Они связаны между собой, а так же с вышестоящим Издателем с помощью свойства `Upstream` и отправляет измененное значение в зависимый оператор (свойство `Downstream`). То есть данное свойство содержит ссылку на вышестоящего Издателя или Оператор, от которого поступю данные. Его экземпляры являются value type.

- `map`
- `compactMap`
- `filter`
- `debounce`
и другие

```swift
// Издатель, реагирующий на изменение текста в текстовом поле и изменяющий события с помощью двух Операторов
let textFieldPublisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: textField) // Publisher
            .map { $0.object as? UITextField } // Operator
            .map { $0?.text } // Operator
```