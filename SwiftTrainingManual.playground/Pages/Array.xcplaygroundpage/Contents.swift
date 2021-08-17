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




// -----
var sourceArray = [1, 2, 3, 4, 5]
// -----

sourceArray.first // Optional(1)

sourceArray.last // Optional(5)

sourceArray.first(where: { $0 > 3 }) // 4




sourceArray.append(8) // [1, 2, 3, 4, 5, 8]

sourceArray.remove(at: 0) // 1
sourceArray // [2, 3, 4, 5]
