/*:
 [Оглавление](HEADER)
 # Regular Expression - регулярные выражения
 
 Производят поиск подстрок в строках на основе шаблона
 
 */

//: ____

import Foundation

//: __Пример использования__

let sourceString = "This is some text (this text will get)! Hello!"
let range = NSRange(location: 0, length: sourceString.utf16.count)
let regexp = try! NSRegularExpression(pattern: "\\(.*\\)")
let result = regexp.firstMatch(in: sourceString, options: [], range: range)
if let range = result?.range {
    let start = sourceString.index(sourceString.startIndex, offsetBy: range.lowerBound+1)
    let end = sourceString.index(sourceString.startIndex, offsetBy: range.upperBound-1)
    let subString = sourceString[start..<end]
    print(subString)
}

