/*:
 [Оглавление](HEADER)
 # Deadlock
 
 Блокировка потока, при которой его дальнейшее выполнение невозможно. Блокировка главного потока приводит к крашу приложения. Взаимная блокировка потоков - лишь один из примеров DeadLock.
 
 */

import Foundation

//: __Способ 1:__ дважды заблокировать NSLock
let lock = NSLock()
lock.lock()
print(1)
lock.lock()
print(2)

//: __Способ 2:__ GDC, вызвать sync на главном потоке

DispatchQueue.main.sync {
    print("some code")
}

//: __Способ 3:__ GDC, вызвать sync внутри async

let queue = DispatchQueue(label: "queue")
queue.async {
    queue.sync {
        print(3)
        // deadlock
    }
}
