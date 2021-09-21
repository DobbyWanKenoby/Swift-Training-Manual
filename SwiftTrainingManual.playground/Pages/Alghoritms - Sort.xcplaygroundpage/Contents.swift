import Foundation

// Базовый протокол для менеджеров сортировки

protocol BaseSortManager {
    associatedtype Element
    var baseCollection: [Element] { get set }
}

// ----
// Быстрая сортировка
// ----
struct QuickSortManager<T: Equatable & Comparable>: BaseSortManager {
    typealias Element = T
    var baseCollection: [T]
    
    //Реализация быстрой сортировки
    enum Method {
        case var1
        case var2
    }

    
    mutating func getSortedBaseCollection(withMethod: Method) -> [T] {
        
        switch withMethod {
        // вариант 1
        case .var1:
            return _quickSortVar1(collection: baseCollection)
        // вариант 2
        case .var2:
            var mutableCollection = baseCollection
            _quickSortVar2(collection: &mutableCollection, low: 0, high: mutableCollection.count-1)
            return mutableCollection
        }
        
    }
    
    // Вариант 1
    // В процессе исполнения потребляет дополнительную память, так как создает временные подмассивы
    private func _quickSortVar1(collection: [T]) -> [T] {
        var mutableSortingCollection = collection
        // быстрая проверка
        guard collection.count > 1 else {
            return collection
        }
        // опорный элемент
        let pivot = mutableSortingCollection.popLast()!
        // подмассивы с меньшими и большими элементами
        let minArray = mutableSortingCollection.filter { $0 < pivot }
        let equalArray = mutableSortingCollection.filter { $0 == pivot }
        let maxArray = mutableSortingCollection.filter { $0 > pivot }
        // отсортированный массив
        return _quickSortVar1(collection: minArray) + equalArray + _quickSortVar1(collection: maxArray)
    }
    
    private func _quickSortVar2(collection: inout [T], low: Int, high: Int) {
        guard low < high else {
            return
        }
        let p = hoare(collection: &collection, low: low, high: high)
        _quickSortVar2(collection: &collection, low: low, high: p)
        _quickSortVar2(collection: &collection, low: p+1, high: high)
    }
    
    private func hoare(collection: inout [T], low: Int, high: Int) -> Int {
        let pivot = collection[ (low + high) / 2 ]
        var i = low - 1
        var j = high + 1
        
        while true {
            repeat {
                j -= 1
            } while collection[j] > pivot

            repeat {
                i += 1
            } while collection[i] < pivot

            if i < j {
                collection.swapAt(i, j)
            } else {
                return j
            }
        }
    }
    
}

var qickSortManager = QuickSortManager(baseCollection: [1, 3, 4, 2, 1, 8])
qickSortManager.getSortedBaseCollection(withMethod: .var2)
