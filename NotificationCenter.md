# Notification Center

`class NotificationCenter : NSObject`

## Содержание

- [Описание](#desc)
- [Использование Notification Center](#use)

## <a id="desc"></a>Описание

Механизм, осуществляющий доставку данных о событиях до подписанных на эти события наблюдателей (observers). Отслеживаемые события могут быть как системные (например появление/скрытие клавиатуры, изменение ориентации экрана), так и собственные.

По умолчанию экземпляр Notification Center в приложении доступен через конструкцию `NotificationCenter.default`. Но при необходимости можно создать дополнительные экземпляры Notification Center, для того, чтобы разграничить передачу данных о событиях.

Все передаваемые с помощью Notification Center события - это экземпляры __структуры__ `Notification` (используется по умолчанию) или класса `NSNotification` (используется в старых версиях операционных систем при разработке на Objective-C, а также когда необходима ссылочная семантика).

> ПРИМЕЧАНИЕ
> 
> Notification Center не имеет ничего общего с push-уведомлениями, локальными уведомлениями или с отображением уведомлений в системе.

## <a id="use"></a>Использование Notification Center

### Создание наблюдателя

Для создания наблюдателя используется метод `addObserver`.

```swift
NotificationCenter.default.addObserver(
	%наблюдатель%,
	selector: %метод, выполняемый при поступлении события%,
	name: %Событие, за которым необходимо наблюдать%,
	object: %передаваемый объект%
)
```

`Selector` должен указывать на метод, принимающий в качестве входного параметра значение типа `Notification`.

```swift
@objc func keyboardWillHide(_ notification: Notification) {
	// ...
}
```

Аргумент `name` определяет событие, за которым будет вестись наблюдение. Классы `UIResponder` и `Notification.Name` имею большое количество встроенных событий, например:

- `UIResponder.keyboardWillShowNotification` - клавиатура будет отображена
- `UIResponder.keyboardDidShowNotification` - клавиатура была отображена
- `UIResponder.keyboardWillHideNotification` - клавиатура будет скрыта
- `UIResponder.keyboardDidHideNotification` - клавиатура была скрыта
- `UIResponder.keyboardWillChangeFrameNotification` - у клавиатуры будет изменен `frame`
- `UIResponder.keyboardDidChangeFrameNotification` - у клавиатуры был изменен `frame`
- `Notification.Name.NSBundleResourceRequestLowDiskSpace` - низкий объем доступного дискового пространства
- `Notification.Name.CKAccountChanged` - статус аккаунт iCloud изменен (используется при работе с `CloudKit`).
- `Notification.Name.NSSystemClockDidChange` - системные часы были изменены

и многое-многое другое.

### Создание кастомного события

Для указания на отслеживаемое событие во входной параметр `name` метода `addObserver` передается значение типа `Notification.Name`. При необходимости можно создать собственное событие с помощью инициализатора данного типа.

```swift
NotificationCenter.default.addObserver(
	%наблюдатель%,
	selector: %метод, выполняемый при поступлении события%,
	name: Notification.Name("userDidLogout"),
	object: %передаваемый объект%
)
```

В данном примере создается наблюдатель за событием `userDidLogout`.

Теперь, чтобы отправить данное событие в произвольном месте проекта у экземпляра класса `NotificationCenter` необходимо вызвать метод `post`.

```swift
NotificationCenter.default.post(name: NotificationCenter.Name("userDidLogout"), object: nil)
```

В качестве аргумента `object` может быть передан произвольный объект, который будет извлечен внутри вызываемого метода с помощью конструкции `object` входного параметра типа `Notification`, например:

```swift
@objc func userDidLogout(_ notification: Notification) {
	let user = notification.object
}
```

## Примеры использования Notification Center

```swift
// появление клавиатуры
NotificationCenter.default.addObserver(
	self,
	selector: #selector(keyboardWillShow),
	name: UIResponder.keyboardWillShowNotification,
	object: nil
)
```

```swift
// скрытие клавиатуры
NotificationCenter.default.addObserver(
	self,
	selector: #selector(keyboardWillHide),
	name: UIResponder.keyboardWillHideNotification,
	object: nil
)
```

