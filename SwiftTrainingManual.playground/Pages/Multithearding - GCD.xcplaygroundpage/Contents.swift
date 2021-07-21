/*:
 [Оглавление](HEADER)
 # Grand Central Dispatch
 
 Библиотека для работы в многопоточном режиме
 
 - GCD позволяет уйти от потоков и работать с абстракцией очередей задач.
 - Распределение задач по потоком происходит в автоматическом режиме.
 - GCD имеет пул потоков, с которыми и работает.
 - GCD имеет несколько заранее созданных (5 global и 1 main) очередей, с которыми можно работать. Но можно создавать и собственные очереди
 - Работа с UI-элементами должна выполнятьс в main-потоке
 
 ### Типы выполняемых задач
 - closure
 - DispatchWorkItem
 */
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
//: ##  Очереди
//: __Создание очередей__
// последовательная очередь
let serialQueue = DispatchQueue(label: "serial")

// параллельная очередь
let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)

// по умолчанию не активная очередь
let inactiveQueue = DispatchQueue(label: "inactive", attributes: [.concurrent, .initiallyInactive])
inactiveQueue.async {
    print("inactive Queue done")
}
if false {
    inactiveQueue.activate() // активация
    inactiveQueue.suspend() // пауза
    inactiveQueue.resume() // снятие с паузы
}


//: __Получение существующих очередей__
// глобальная очередь
let globalQueue = DispatchQueue.global()
let globalQueueBackground = DispatchQueue.global(qos: .background)
// основная очередь
let mainQueue = DispatchQueue.main

//: ##  Выполнение кода
let queue = DispatchQueue.global()
//: __Асинхронное и синхронное выполнение__
if false {
    // асинхронно
    queue.async {
        print("async on global queue on \(Thread.current)")
        // ...
    }
}
//: __Выполнить в определенное время__
if false {

    // асинхронно через 5 секунд
    queue.asyncAfter(deadline: .now() + .seconds(2)) {
        print("async on global queue after 2 seconds \(Thread.current)")
        // ...
    }
}

//: __Распределенное по потокам выполнение цикла (синхронное, блокирует текущий поток)__
// при этом все иттерации могут идти не по порядку
// суть в том, что их должно быть просто указанное количество
// но, например, иттерации 100 может быть позже 102
if false {
    DispatchQueue.concurrentPerform(iterations: 2000) { itteration in
        print("\(itteration) on \(Thread.current)")
    }
}
//: __Асинхронное распределенное выполнение цикла (не блокирует текущий поток)__
if false {
    queue.async {
        DispatchQueue.concurrentPerform(iterations: 2000) { itteration in
            print("\(itteration) on \(Thread.current)")
        }
    }
}

//: ##  Dispatch Work Item
//: Объект типа DispatchWorkItem инкапсулирует в себе некую задачу, которая может быть выполнена. Выполнение такой работы может быть остановлено и возобновлено. Также можно настроить нотификацию о завершении работы

//: __Использование WorkItem__
let workItem = DispatchWorkItem {
    print("WorkItem did start in thread \(Thread.current)")
    Array(1...20000).forEach {
        print($0)
    }
}
// нотификация о завершении работы WorkItem
workItem.notify(queue: .main) {
    print("WorkItem did finish")
}

// вызов WorkItem
if true {
    concurrentQueue.async(execute: workItem)
}

