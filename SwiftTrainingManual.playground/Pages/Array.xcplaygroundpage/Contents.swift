// 1
// Массив может быть создан с помощью облегченного синтаксиса

var numberArray = [1, 2, 3]
// в этом случае тип массива определяется автоматически
// на основании типа переданных элементов
// в массиве будут содержаться три значения типа Int

// для созданяи пустого массива можно использовать
var emptyArray = [Double]()
// в данный массив могут быть добавлены только элементы типа Double

// 2
// Массив может быть создан с помощью ключевого слова Array

// массив с 2 элементами типа Character
var alphArray = Array(arrayLiteral: Character("a"), "b")

// массив с одинаковыми элементами
var repeatingArray = Array(repeating: 0, count: 3) // [0, 0, 0]

// массив на основе диапазона
var arrayFromRange = Array(1...4) // [1, 2, 3, 4]

// массив на основе последовательности
var set = Set(arrayLiteral: 1,3,2)
var arrayFromSet = Array(set)
// в данном случае итоговый порядок элементов в массиве
// будет изменяться при каждом исполнении кода
// он зависит от хэшей элементов (протокол Hashable)

// 3
// Массив может быть создан с помощью указания полного типа данных

// массив с 3 элементами типа Float
var floatArray: Array<Float> = [1, 2, 3]

// массив c 2 элнементами типа Character
var stringArray = Array<Character>(arrayLiteral: "a", "b")

// -----
// плоский массив
var sourceArray = [1, 2, 3, 4, 5]
// многомерный массив
var matrixArray = [ [1, 2, 3], [4, 5, 6], [7, 8, 9] ]
// массив с опционалами
var optionalArray: Array<Int?> = [ nil, 2, nil, 4, nil, 6]

// структура для хранения в массиве
struct Man {
    var name: String
    var age: Int
}
// массив для хранения структуры
var structArray = [
    Man(name: "Bazil", age: 30),
    Man(name: "Alex", age: 42),
    Man(name: "Helga", age: 21)]
// -----

sourceArray.first // Optional(1)
sourceArray.last // Optional(5)
sourceArray.first(where: { $0 > 3 }) // 4

if true {
    sourceArray.firstIndex(of: 2) // 1

    let findex = sourceArray.firstIndex(where: { $0 > 2 })
    findex // 2

    sourceArray.lastIndex(of: 3) // 2

    let lindex = sourceArray.lastIndex(where: { $0 < 3 })
    lindex // 1
}



if false {
    sourceArray.append(8) // [1, 2, 3, 4, 5, 8]
    sourceArray.remove(at: 0) // 1
    sourceArray // [2, 3, 4, 5]
    optionalArray.insert(99, at: 3) // [nil, 2, nil, 99, 4, nil, 6]
}

if true {
    sourceArray.removeAll() // []
}


if true {
    // получения больше элемента без условий
    sourceArray.max()
    // получение большего элемента с предвварительной сортировкой
    let man = structArray.max(by: { $0.age < $1.age }) //
    man?.age // экземпляр с age = 42
}

if true {
    let editArray = sourceArray.map { $0 + 1 }
    editArray // [2, 3, 4, 5, 6]
    
    let anotherEditArray = optionalArray.map { $0 }
    anotherEditArray // [nil, 2, nil, 4, nil, 6]
}

if true {
    let editArray = optionalArray.compactMap { $0 }
    editArray
}

if true {
    let men = structArray.filter { $0.age > 29 }
    men // [{name "Bazil", age 30}, {name "Alex", age 42}]
}

if false {
    // сортировка по возрастанию
    structArray.sort { $0.age < $1.age }
    structArray // [{name "Helga", age 21}, {name "Bazil", age 30}, {name "Alex", age 42}]
}

if true {
    let newArray = sourceArray.sorted(by: {
        $0 > $1
    })
    newArray // [5, 4, 3, 2, 1]
}
