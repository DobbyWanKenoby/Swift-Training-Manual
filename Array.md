# Массивы

## Описание
Массив позволяет организовать множество элементов в кдиное значение, в котором элементы упорядочены и могут быть получены напрямую с помощью индексов.

### Типы данных

При работе с массивами используются следующие типы данных:

- `Array`
- `ContiguousArray`
- `ArraySlice`
- `NSArray`
- `NSMutableArray`

### <a id="array"></a>Тип `Array`

### <a id="contiguousarray"></a>Тип `ContiguousArray`

### <a id="arrayslice"></a>Тип `ArraySlice`

### <a id="nsarray"></a>Тип `NSArray`

### <a id="nsmutablearray"></a>Тип `NSMutableArray`

## Операции

### Инициализация

Обычно для создания массива используют тип `Array`, но если вы уверены, что элементы массива не будут классами или протоколами `@objc`, то для оптимизации можно использовать `ContiguousArray`. В ином случае `Array` сам примет решение о том, значение какого типа ему создать (`NSArray` или `ContiguousArray`).

##### Создание массива

```swift
// массив с 3 элементами типа Int
var array1 = [1, 2, 3]

// пустой массив, который может хранить целочисленные значения
var array2 = [Int]()

// массив с 2 элементами типа String
var array3 = Array(arrayLiteral: "a", "b")

// массив с 3 элементами типа Float
var array4: Array<Float> = [1, 2, 3]

// с одинаковыми элементами
var array5 = Array(repeating: 0, count: 3) // [0, 0, 0]

// на основе последовательности
var set = Set(arrayLiteral: 1,3,2)
var array6 = Array(set)
// в данном случае итоговый порядок элементов в массиве
// будет изменяться при каждом исполнении кода
// он зависит от хэшей элементов (протокол Hashable)
```

### Доступ к элементам

> Все последующие операции будем производить с массивом `sourceArray`.
>
> ```swift
> var sourceArray = [1, 2, 3, 4, 5]
> ```

##### Получение элемента по индексу

```swift
sourceArray[2] // 3
```

##### Получение первого элемента

Метод `first` возвращает опционал, так как массив может не содержать элементов.

```swift
sourceArray.first // Oprional(1)
```

##### Получение последнего элемента

Метод `last` возвращает опционал, так как массив может не содержать элементов.

```swift
sourceArray.last // Optional(5)
```

##### Получение элемента с условием

Вы можете указать произвольное условие для поиска элемента

```swift
// первый элемент со значением больше 3
sourceArray.first(where: { $0 > 3 }) // Optional(4)
```

### Операции со значениями

> Все последующие операции будем производить с массивом `sourceArray`.
>
> ```swift
> var sourceArray = [1, 2, 3, 4, 5]
> ```

##### Добавление элемента

Метод `append(_:)` добавляет элемент в конец массива.

```swift
sourceArray.append(8) // [1, 2, 3, 4, 5, 8]
```

##### Удаление элемента.

Метод `remove(at:)` возвращает удаленный элемент. В качестве аргумента передается индекс удаляемого элемента.

```swift
sourceArray.remove(at: 0) // 1
sourceArray // [2, 3, 4, 5]
```

## Дополнительная информация

- [Документация к типу `Array`](https://developer.apple.com/documentation/swift/array)
- [Документация к типу `NSArray`](https://developer.apple.com/documentation/foundation/nsarray)
- [Исходный код типа `Array`](https://github.com/apple/swift/blob/main/stdlib/public/core/Array.swift)
- [Исходный код типа `ContiguousArray`](https://github.com/apple/swift/blob/main/stdlib/public/core/ContiguousArray.swift)