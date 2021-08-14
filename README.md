# Swift Training Manual
Справочник с кратким описанием функциональных механизмов и возможностей языка программирования Swift, содержит примеры их применения.

В состав справочника входят тематические статьи и playground-проект с листингами.

## Оглавление

### Запуск и функционирование приложения

- [Запуск приложения](./AppExecution.md#launch)
- [Оперативная память в iOS](./MemoryManagement.md)
- [Процессы](./AppExecution.md#processes)
- [Потоки и многопоточность](/Thearding.md)
- [RunLoop](/RunLoop.md)
- [Objective-C Runtime](/ObjectiveCRuntime.md)

### Практики программировавния

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

### H
- Heap [[1](/MemoryManagement.md#heap)]

### M
- MRC - Manual reference counting [[1](/MemoryManagement.md#mrc)]

### S
- Stack (memory) [[1](/MemoryManagement.md#stack)]

---
<a id="rus"></a>
### К
- Куча [[1](/MemoryManagement.md#heap)]

### С
- Стек (память) [[1](/MemoryManagement.md#stack)]


## Использование playground-файла

1. Скачайте playground-файл.
2. Откройте в Xcode Playground.
3. Откройте странице HEADER

Для удобной работы с файлом включите отображение Markdown-синтаксиса
	- Editor -> Show Rendered Markup
	- На требуемых страницах в File Inspector отметить пункт Render Documentation
