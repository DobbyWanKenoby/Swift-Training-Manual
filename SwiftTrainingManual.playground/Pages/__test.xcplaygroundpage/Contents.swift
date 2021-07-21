//: [Previous](@previous)

import Foundation
import CoreFoundation
//import UIKit
import PlaygroundSupport

PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true


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
