/*:
 [Оглавление](HEADER)
 # Race Condition
 
 
 */

import Foundation

//: ### Пример на pthread
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

DispatchQueue.concurrentPerform(iterations: 10) { i in
    array.append(i)
}

print(array)
// в результате в некоторых случаях в массиве будут храниться не 10 элементов
// как предполагалось, а меньше
