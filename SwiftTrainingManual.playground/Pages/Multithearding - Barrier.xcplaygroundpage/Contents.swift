/*:
 [Оглавление](HEADER)
 # Barrier (GCD)
 
 Аттрибут для задачи, который позволяет выполнять только текущую задачу даже в асинхронном режиме
 
 */

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true
//: __Использование барьеров__

// Race Condition
// Работа по добавлению значений в массив идет в несколько потоков
// из-за этого в итоге в массиве не 10 элементов, а меньше
if false {
    var array: [Int] = []
    DispatchQueue.concurrentPerform(iterations: 10) { i in
        array.append(i)
    }
    print(array) // часто < 10 элементов
}


// для исправления можем использовать барьеры
// чтобы добавление шло, когда другие задачи не исполняются

var arrayCorrect: [Int] = []
var queue = DispatchQueue(label: "queue")
for i in 1...10 {
    queue.async(group: nil, qos: .default, flags: .barrier) {
        arrayCorrect.append(i)
    }
}
sleep(2)
print(arrayCorrect) // всегда содержит 10 элементов

// Другое решение
// Создать собственную реализацию Array, в которой append происходит в потоке с barrier-флагом
