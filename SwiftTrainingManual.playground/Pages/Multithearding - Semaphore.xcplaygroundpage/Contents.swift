/*:
 [Оглавление](HEADER)
 # Semaphore
 
 ## Описание
 Позволяет заблокировать выполнение потока для обеспечения персонального доступа к данным.  В отличии от mutex ([NSLock](Multithearding%20-%20NSLock)) позволяет работать не с одним потоком, а с несколькими.
 */

import Foundation

//: __Создание семафора__

// value - количество потоков, которые одновременно пропускает семафор
let semaphore = DispatchSemaphore(value: 2)

//: __ Пример использования семафора__

// в зависимости от значения value одновременно будет выполняться указанное количество потоков
// остальные будут ждать пока семафор освободится

if false {

    let queue = DispatchQueue(label: "concurrentQueue", attributes: .concurrent)
    queue.async {
        semaphore.wait() // value - 1
        sleep(3)
        print("method 1")
        semaphore.signal() // value + 1
    }

    queue.async {
        semaphore.wait() // value - 1
        sleep(3)
        print("method 2")
        semaphore.signal() // value + 1
    }

    queue.async {
        semaphore.wait() // value - 1
        sleep(3)
        print("method 3")
        semaphore.signal() // value + 1
    }

    // этот код отсчитывает и показывает секунды
    // чтобы было видно на какой секунде срабатывает какой поток
    queue.async {
        for i in Array(1...7) {
            print(i)
            sleep(1)
        }
    }
    
}

//: __ Пример использования семафора__

if true {

    let sem = DispatchSemaphore(value: 2)
    DispatchQueue.concurrentPerform(iterations: 10) { itteration in
        sem.wait()
        sleep(1)
        print("Closure: \(itteration)")
        sem.signal()
    }

}
