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
-	Дата и время
	- [DispatchTime и DispatchWallTime](./DispatchTime.md)

### Асинхронное выполнение кода

- [Потоки и многопоточность](/Thearding.md)
- [Асинхронные и реактивные интерфейсы iOS](./Async.md)
	- [Notification Center](./NotificationCenter.md)
	- [KVO и KVC](KVO-KVC.md)
	- [Combine](./Combine.md)



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
- Autorelease (Autoreleasepool) [[1](/MemoryManagement.md#autoreleasepool)]
- ARC (Automatic reference counting, Автоматическое управление памятью) [[1](/MemoryManagement.md#arc)]
- Array (Тип данных) [[1](/Array.md#array)]
- Attributes (Аттрибуты)
	- @main [[1](./AppExecution.md#launch)]
	- @objc [[1](/ObjectiveCRuntime.md)]
	- @UIApplicationMain [[1](./AppExecution.md#launch)]

### C
- Сopy-on-assignment (COA, копирование при иницииализации) ([1](./MemoryManagement.md#coa-cow))
- ContiguousArray (Тип данных) [[1](/Array.md#contiguousarray)]
- Combine (фреймворк) [[1](/Combine.md)]
- Сopy-on-write (COW, копирование при записи) ([1](./MemoryManagement.md#coa-cow))

### D
- DispatchTime (Тип данных) ([1](./DispatchTime.md))
- DispatchWallTime (Тип данных) ([1](./DispatchTime.md)) 

### H
- Heap (Куча) [[1](/MemoryManagement.md#heap)]

### K
- KVC (Key-Value Coding) [[1](/KVO-KVC.md)]
- KVO (Key-Value Observing) [[1](/KVO-KVC.md)]

### M
- MRC (Manual reference counting, Ручное управление памятью) [[1](/MemoryManagement.md#mrc)]
- Multithearding (Многопоточность) [[1](/Thearding.md#mrc)]

### N
- NotificationCenter (Класс) [[1](./NotificationCenter.md)]
- Notification Center (Центр уведомлений) [[1](./NotificationCenter.md)]
- NSArray (Тип данных) [[1](/Array.md#nsarray)]
- NSMutableArray (Тип данных) [[1](/Array.md#nsmutablearray)]

### S
- Stack (Стек) [[1](/MemoryManagement.md#stack)]

## Использование playground-файла

1. Скачайте playground-файл.
2. Откройте в Xcode Playground.
3. Откройте странице HEADER

Для удобной работы с файлом включите отображение Markdown-синтаксиса
	- Editor -> Show Rendered Markup
	- На требуемых страницах в File Inspector отметить пункт Render Documentation
