# Swift. Справочник
Справочник с кратким описанием функциональных механизмов и возможностей языка программирования Swift, содержит примеры их применения.

В состав справочника входят тематические статьи и playground-проект с листингами.

## Оглавление

### Запуск и функционирование приложения

- [Компиляция приложения](./AppCompilation.md)
- [Запуск и функционирование приложения](./AppExecution.md)
	- [Запуск приложения](./AppExecution.md#launch)
	- [Процессы](./AppExecution.md#processes)
- [RunLoop](./RunLoop.md)
- [Objective-C Runtime](./ObjectiveCRuntime.md)
- [Управление памятью в iOS](./MemoryManagement.md)
	- [Структура памяти](./MemoryManagement.md#structure)
	- [Стек](./MemoryManagement.md#stack)
	- [Куча](./MemoryManagement.md#heap)
	- [Подсчет ссылок. MRC и ARC](./MemoryManagement.md#refcounting)
	- [Autoreleasepool](./MemoryManagement.md#autoreleasepool)
	- [Value type и Reference type](./MemoryManagement.md#usememory)
	- [Copy-on-assignment и Copy-on-write](./MemoryManagement.md#coa-cow)

### Типы данных

-	[Swift Standard Library](./SwiftStandardLibrary.md)
-	[Строковые типы данных](./String.md)
-	[Массив (Array)](./Array.md)

### Асинхронные и реактивные интерфейсы

- [Асинхронные и реактивные интерфейсы iOS](./Async.md)
	- [Notification Center](./NotificationCenter.md)
	- [KVO и KVC](KVO-KVC.md)
	- [Combine](./Combine.md)
	- [Потоки и многопоточность](/Thearding.md)

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
- Combine [[1](/Combine.md)]

### H
- Heap (область памяти) [[1](/MemoryManagement.md#heap)]

### K
- KVC (Key-Value Coding) [[1](/KVO-KVC.md)]
- KVO (Key-Value Observing) [[1](/KVO-KVC.md)]

### M
- MRC - Manual reference counting [[1](/MemoryManagement.md#mrc)]

### N
- Notification Center [[1](./NotificationCenter.md)]
- NSArray [[1](/Array.md#nsarray)]
- NSMutableArray [[1](/Array.md#nsmutablearray)]

### S
- Stack (область памяти) [[1](/MemoryManagement.md#stack)]

## Использование playground-файла

1. Скачайте playground-файл.
2. Откройте в Xcode Playground.
3. Откройте странице HEADER

Для удобной работы с файлом включите отображение Markdown-синтаксиса
	- Editor -> Show Rendered Markup
	- На требуемых страницах в File Inspector отметить пункт Render Documentation
