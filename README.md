# Swift Training Manual
Справочник с кратким описанием функциональных механизмов и возможностей языка программирования Swift, содержит примеры их применения.

В состав справочника входят тематические статьи и playground-проект с листингами.

## Оглавление

### Запуск и функционирование приложения

- [Компиляция приложения](./AppCompilation.md)
- [Запуск приложения](./AppExecution.md#launch)
- [Оперативная память в iOS](./MemoryManagement.md)
- [Процессы](./AppExecution.md#processes)
- [Потоки и многопоточность](/Thearding.md)
- [RunLoop](./RunLoop.md)
- [Objective-C Runtime](./ObjectiveCRuntime.md)

### Типы данных

-	[Swift Standard Library](./SwiftStandardLibrary.md)
-	[Строковые типы данных](./String.md)
-	[Массивы (array)](./Array.md)

### Хранение данных

- [CoreData](./CoreData.md)

### Тестирование приложения

- [Симулятор](./Simulator.md)

### Практики программирования

- [Выбор между `struct` и `class`](./StructClassChoise.md)

### Создание универсальных приложения

- [Интернационализация и локализация](./Localization.md)
- Универсальный доступ (Accessibilities)

## Предметный указатель

- [Русские термины](#rus)
- [Английские термины](#eng)

<a id="eng"></a>
### A
- Autorelease (pool) [[1](/MemoryManagement.md#autoreleasepool)]
- ARC - Automatic reference counting [[1](/MemoryManagement.md#arc)]
- Array (тип данных) [[1](/Array.md#array)]
- Attributes
	- @main [[1](./AppExecution.md#launch)]
	- @objc [[1](/ObjectiveCRuntime.md)]
	- @UIApplicationMain [[1](./AppExecution.md#launch)]

### C
- ContiguousArray [[1](/Array.md#contiguousarray)]

### H
- Heap (область памяти) [[1](/MemoryManagement.md#heap)]

### M
- MRC - Manual reference counting [[1](/MemoryManagement.md#mrc)]

### N
- NSArray [[1](/Array.md#nsarray)]
- NSMutableArray [[1](/Array.md#nsmutablearray)]

### S
- Stack (область памяти) [[1](/MemoryManagement.md#stack)]

---
<a id="rus"></a>
### А
- Аттрибуты
	- @main [[1](./AppExecution.md#launch)]
	- @objc [[1](/ObjectiveCRuntime.md)]
	- @UIApplicationMain [[1](./AppExecution.md#launch)]

### К
- Куча (область памяти) [[1](/MemoryManagement.md#heap)]

### М
- Массив (тип данных) [[1](/Array.md#array)]

### С
- Стек (область памяти) [[1](/MemoryManagement.md#stack)]


## Использование playground-файла

1. Скачайте playground-файл.
2. Откройте в Xcode Playground.
3. Откройте странице HEADER

Для удобной работы с файлом включите отображение Markdown-синтаксиса
	- Editor -> Show Rendered Markup
	- На требуемых страницах в File Inspector отметить пункт Render Documentation
