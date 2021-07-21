/*:
 [Оглавление](HEADER)
 # NSObject
 
 ### Описание
 
 Базовый класс для большинства Obj-C классов. Имеет ряд методов для запуска objc-кода (через Selector) на различных потоках.
 */

import Foundation

class A: NSObject {
    @objc func doWork() {
        print("did work")
    }
}

let a = A()
a.perform(#selector(a.doWork), on: Thread(), with: nil, waitUntilDone: false)
print(123)
