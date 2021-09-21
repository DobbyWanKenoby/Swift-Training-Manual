//: [Previous](@previous)

import Foundation
import CoreFoundation
//import UIKit
import PlaygroundSupport

PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true

protocol Proto {
    var a: Int { get }
}

extension Proto {
    var a: Int {
        return 2
    }
}

class FooClass: Proto {
    var a: Int {
        return 5
    }
}

var imp = FooClass()
imp.a




var array = [1, 2, 3, 4]
array.description

var result = ""
// ...
var first = true
for item in self {
  if first {
    first = false
  } else {
    result += ", "
  }
  debugPrint(item, terminator: "", to: &result)
}
// ...


// Возвращаем строку в соответствии с текущей локалью
let quantity = NumberFormatter.localizedString(from: 5000, number: .decimal) // 5,000

// создаем форматтер
var numFormatter = NumberFormatter()
// указываем стиль интернационализации чисел
numFormatter.numberStyle = .decimal
// указываем значение
let value: NSNumber = 5000

// проверяем текущую локаль
numFormatter.locale // en_US
numFormatter.string(from: value) // 5,000

// изменяем локаль
numFormatter.locale = Locale.init(identifier: "ru_RU")
numFormatter.string(from: value) // 5 000


print(String.localizedStringWithFormat("some key of Localizable.strings", quantity))

let price = 149.00 as NSNumber
let formatter = NumberFormatter()
formatter.numberStyle = .decimal
//formatter.currencyCode = "EUR"
formatter.locale = Locale.current
formatter.string(from: price)

let quantity = NumberFormatter.localizedString(from: 5000, number: .currency)

Dispatch
if true {
    
    var array: [Int] = []
    
    DispatchQueue.concurrentPerform(iterations: 10) { i in
        array.append(i)
    }
    
    print(array)
}

//: __Попытка передать данные между тредами__
// не удалось

class R1: NSObject, PortDelegate {
    func handle(_ message: PortMessage) {
        print(message)
    }
}

var portSource = NSMachPort(machPort: 1, options: .deallocateReceiveRight)

var portReceiver = NSMachPort(machPort: 2, options: .deallocateSendRight)

Thread.detachNewThreadSelector(<#T##selector: Selector##Selector#>, toTarget: <#T##Any#>, with: <#T##Any?#>)

Thread.detachNewThread {
    print(1)
    let loop = RunLoop.current
    loop.add(portReceiver, forMode: .default)
    loop.add(portSource, forMode: .default)
    var isExit = false
    while !isExit {
        print(2)
        loop.run(mode: .default, before: Date.init(timeIntervalSinceNow: 1))
    }
    

}

Thread.detachNewThread {
    print(2)
    let loop = RunLoop.current
    loop.add(portReceiver, forMode: .default)
    loop.add(portSource, forMode: .default)
    
    let message = PortMessage(send: portSource, receive: portReceiver, components: [1,2,3])
    print(5)
    message.send(before: Date.init(timeIntervalSinceNow: 1))
    print(5)
}
RunLoop.current.add(portReceiver, forMode: .default)
print(3)
