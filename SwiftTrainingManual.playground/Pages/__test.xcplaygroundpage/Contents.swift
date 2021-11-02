//: [Previous](@previous)

import Foundation
import CoreFoundation
//import UIKit
import PlaygroundSupport

PlaygroundSupport.PlaygroundPage.current.needsIndefiniteExecution = true

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
