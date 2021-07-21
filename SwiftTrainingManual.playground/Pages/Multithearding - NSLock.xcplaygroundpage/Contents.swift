/*:
 [Оглавление](HEADER)
 # NSLock - mutex / блокировка / замок
 
 class NSLock: NSObject, NSLocking
 
 Позволяет заблокировать выполнение потока для обеспечения персонального доступа к данным. Пока поток работает с данными, все остальные потоки ожидают их освобождения.
 * Удобная обертка pthread_mutex_t
 * Подвид [семафора](Multithearding%20-%20Semaphore), который может пропустить только 1 поток
 * Замок может быть разблокирован __только__ из того же потока, где был заблокирован
 
 ### Ошибки при использовании
 * Двойная блокировка NSLock приведет к [Deadlock](Multithearding%20-%20Deadlock). При необходимости многократной блокировки используем NSRecursiveLock
 
 
 */

import Foundation

//: __Пример Race Condition без синхронизации__

class NotSaveThread {
    func doWork(completion: @escaping () -> Void) {
        let thread = Thread {
            completion()
        }
        thread.start()
    }
}

var sum = 0
let notSaveThread1 = NotSaveThread()
notSaveThread1.doWork {
    for _ in 1...10000 {
        sum += 1
    }
}
notSaveThread1.doWork {
    for _ in 1...10000 {
        sum += 1
    }
}

sleep(1)
print(sum)

// Итоговое значение sum отличается от 20000

//: __Исправляем ошибку с помощью NSLock__

class SaveThread {
    
    private var lock = NSLock()
    
    func doWork(completion: @escaping () -> Void) {
        let thread = Thread {
            self.lock.lock()
            defer {
                self.lock.unlock()
            }
            completion()
        }
        thread.start()
    }
}

var sum2 = 0
let saveThread1 = SaveThread()
saveThread1.doWork {
    for _ in 1...10000 {
        sum2 += 1
    }
}
saveThread1.doWork {
    for _ in 1...10000 {
        sum2 += 1
    }
}

sleep(1)
print(sum2)
