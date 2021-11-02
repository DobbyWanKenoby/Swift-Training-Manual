# Проблемы многопоточности

[К оглавлению](./README.md)

## Структура раздела
- [Описание](#desc)
- [Race Condition](#race)
- [Deadlock](#deadlock)
- [Livelock](#livelock)

## <a id="desc"></a>Описание

## <a id="race"></a>Race Condition

```swift
/: ### Пример на pthread
var firstThread: pthread_t?
var secondThread: pthread_t?
var sum = 0

pthread_create(&firstThread, nil, { _ in
    for _ in 1...10000 {
        sum += 1
    }
    return nil
}, nil)

pthread_create(&secondThread, nil, { _ in
    for _ in 1...10000 {
        sum += 1
    }
    return nil
}, nil)
pthread_join(firstThread!, nil)
pthread_join(secondThread!, nil)
print(sum)
// значение в консоли довольно часто будет отличаться от 20000
// для исправления используем синхронизацию


//: ### Пример на GCD

var array: [Int] = []
s
DispatchQueue.concurrentPerform(iterations: 10) { i in
    array.append(i)
}

print(array)
// в результате в некоторых случаях в массиве будут храниться не 10 элементов
// как предполагалось, а меньше
```

## <a id="deadlock"></a>Deadlock

Блокировка потока, при которой его дальнейшее выполнение невозможно. Блокировка главного потока приводит к крашу приложения. Взаимная блокировка потоков - лишь один из примеров DeadLock.

import Foundation

```swift
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
```

## <a id="livelock"></a>Livelock

## <a id="priority"></a>Priority Inversion

### Описание

Возникает, когда более код с более высоким приоритетом ждет выполнения менее значимого кода. Получается, что вроде бы код должен выполняться в первую очередь, но его исполнение зависит от менее значимого кода.
 
### Причины

* Ошибки проектирования, в частности не продуманное использование механизмов синхронизации (`NSLock`, `NSConditionLock`).
