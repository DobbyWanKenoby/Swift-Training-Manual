/*:
 [Оглавление](HEADER)
 # Operation
 
 Библиотека для работы в многопоточном режиме
 
 - Предоставляет доступ к нескольким классам, основным из которых является Operation
 - Operation объединяет код и данные для выполнения некоторой задачи
 - OperationQueue переводит выполнение кода из main потока
 
 ### Operation Lifecycle
 - pending - отложена
 - ready - готова
 - executing - выполняется
 - finished - закончена
 - cancelled - отменена/уничтожена
 
 ### Доступные элементы
 - BlockOperation - блоки кода, которые выполняются в режиме concurrent, но при этом приостанавливают текущий поток (то есть выполняются синхронно)
 - OperationQueue - очередь операций (Operations), которые выполняюстя на основе их приоритета и готовности
 */
import Foundation

//: __Использование BlockOperation__

if false {
    
    // добавляем первый блок
    let block = BlockOperation {
        print("This is block Operation in \(Thread.current)")
        sleep(2)
    }
    
    // добавляем второй блок
    block.addExecutionBlock {
        print("This is second block Operation in \(Thread.current)")
    }
    
    block.start()
    print("current thread is \(Thread.current)")
    // block исполнился в главном потоке
    // но если добавить его в OperationQueue то он будет переведен в один из глобальных
}

//: __Использование OperationQueue__

if false {

    let closure = {
        print("Current thread is \(Thread.current)")
    }
    closure()
    //  closure - обычное замыкание, которое выполнилось в главном потоке

    let queue = OperationQueue()
    queue.addOperation(closure)
    // теперь данное замыкание выполнилось в одном из глобальных потоков
    // Operation сам выбрал поток
    
    // также в OperationQueue можно добавить и BlockOperation
    // а не просто closure
}

//: __Выполнение кода после завершения выполнения Operation__
// Можно остановить выполнение кода до тех пор, пока не будут выполнены все Operation в OperationQueue
if false {
    let operationQueue = OperationQueue()
    operationQueue.addOperation {
        print("1")
        sleep(1)
        print("2")
    }
    
    operationQueue.waitUntilAllOperationsAreFinished() // без этой строчки "3" выведется быстрее, чем "2"
    
    operationQueue.addOperation {
        print("3")
    }
}

// то же самое, но с BlockOperation

if false {
    let block = BlockOperation {
        print(1)
        sleep(1)
        print(2)
    }
    
    let block2 = BlockOperation {
        print(3)
    }
    
    let block3 = BlockOperation {
        print(4)
    }
    
    let operationQueue = OperationQueue()
    operationQueue.addOperations([block, block2], waitUntilFinished: true) // сперва будут выполнены block и block2
    operationQueue.addOperation(block3) // потом block3
}

// так же можно указать completionClosure

if true {
    
    let operation = BlockOperation {
        print(1)
        sleep(1)
    }
    // данный блок будет выполнен после завершения вывполнения Operation
    operation.completionBlock = {
        print(2)
    }
    operation.start()
    
}
