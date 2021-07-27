/*:
 [Оглавление](HEADER)
 # Grand Central Dispatch
 
 Библиотека для работы в многопоточном режиме
 
 - GCD позволяет уйти от потоков и работать с абстракцией очередей задач.
 - Распределение задач по потоком происходит в автоматическом режиме.
 - GCD имеет пул потоков, с которыми и работает.
 - GCD имеет несколько заранее созданных (5 global и 1 main) очередей, с которыми можно работать. Но можно создавать и собственные очереди
 - Работа с UI-элементами должна выполнятьс в main-потоке
 - Инструкции могут быть определены с помощью closure или DispatchWorkItem
 
 ### Типы выполнения
 - sync - работа текущего потока преостанавливается, пока не будет выполнен синхронно переданный код
 - async - работа текущего потока не преостанавливается
 
 __!!! Внимание__ main очередь является serial, поэтому добавление в нее задач с помощью async приводит к их постановке в очередь, но выполняются они позже, когда очередь освободится.
 
 ### Групповое выполнение задач
 - DispatchGroup - позволет запланировать выполнение некоторой задачи после того, как будут выполнен ряд предварительных задач. Например сперва загрузка 10 изображений, а уже потом их отображение на сцене.
 
 ### Другое
 - DispatchSource - програмнный интерфейс для мониторинга различных низкоуровневых источников данных, например событий файловой системы, портов, таймеров, сокетов и т.д.
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
if false {
    concurrentQueue.async(execute: workItem)
}

//: ##  DispatchGroup

//: __ Использование DispatchGroup__

if false {

    let group = DispatchGroup()

    // так как очередь серийная, то одновременно будет выполняться только 1 поток
    // в случае concurrent все потоки запустятся одновременно
    for i in Array(1...3) {
        serialQueue.async(group: group) {
            //sleep(1)
            print("itteration - \(i)")
        }
    }
    
    // данное замыкание будет выполнено, когда вся группа отработает
    group.notify(queue: .main) {
        print("Group did finish")
    }

}

//: __ Использование DispatchGroup__

if false {
    
    let group = DispatchGroup()
 
    for i in Array(1...3) {
        // увеличием счетчик группы на 1
        group.enter()
        concurrentQueue.async {
            sleep(1)
            print("itteration - \(i)")
            // уменьшаем счетчик группы на 1
            group.leave()
        }
    }
    
    // когда счетчик группы будет равен 0 (все задачи выполнены)
    // то выполняется этот блок кода
    group.notify(queue: .main) {
        print("Group did finish")
    }
     
}

//: ##  DispatchSource

//: __ Создание таймера__
//if true {
    
    let timer = DispatchSource.makeTimerSource(queue: .global())
    timer.setEventHandler {
        print("Timer did end")
    }
    timer.schedule(deadline: DispatchTime.now(), repeating: 5 )
    timer.activate()
    
    //sleep(30)
//}
