//: [Previous](@previous)

import UIKit
import Darwin
import CoreFoundation
//import UIKit
import PlaygroundSupport

PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true

func smth(_ codeNumber: Int) -> String {
    switch codeNumber {
    case 1..<3:
        return "looser"
    case 3...5:
        return "pre winner"
    default:
        return "winner"
    }
}

smth(3)




// Обертка для структуры
final class Ref {
    static let shared: Ref = {
        var item = Item()
        item.value = 101
        return Ref(item)
    }()
    var instance: Item
    init( _ instance: Item) {
        self.instance = instance
    }
}

// Сама структура
struct Item {
    var value = 100
}

// Проверка работы
let a = Ref.shared
let b = Ref.shared
a.instance.value = 102
b.instance.value // 102

//struct Box {
//    static var shared: Box {
//        get {
//            Self._ref.val
//        }
//        set {
//            Self._ref.val = newValue
//        }
//    }
//    private static var _ref: Wrapper = Wrapper(Box())
//
//    var value: Int = 100
//}
//
//class Wrapper<T> {
//    var val: T
//    init( _ v: T) {
//        val = v
//    }
//}
//
//Box.shared.value = 101
//var b = Box.shared
//b.value
//





//struct Box<T> {
//    var ref: Ref<T>
//    init(_ x: T) {
//        ref = Ref(x)
//    }
//    var value: T {
//        get { return ref.val }
//        set {
//            if (!isUniquelyReferenceNonObjC(&ref)) {
//                ref = Ref(newValue)
//                return
//            }
//            ref.val = newValue
//        }
//    }
//}





protocol MyProtocol {
	func firstMethod() -> String
}

extension MyProtocol {
	func firstMethod() -> String {
		return "1"
	}
	func secondMethod() -> String {
		return "2"
	}
}

class FirstClass: MyProtocol {
	func firstMethod() -> String {
		return "3"
	}
}

class SecondClass: MyProtocol {
	func firstMethod() -> String {
		return "4"
	}
	func secondMethod() -> String {
		return "5"
	}
}

var res = ""
res += FirstClass().firstMethod()
res += (FirstClass() as MyProtocol).firstMethod()
res += SecondClass().firstMethod()
res += SecondClass().secondMethod()
print(res)
