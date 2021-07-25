/*:
 [Оглавление](HEADER)
 # Операции с числами

 */
import Foundation
//: __Округление числа__
if true {

    // вверх до ближайшего целого
    let ceilNumber = ceil(2.12) // 3
    
    // вниз до ближайшего целого
    let floorNumber = floor(2.12) // 2

    // по правилам математики
    let roundBottomNumber = round(2.2) // 2
    let roundUpperBottom = round(2.6) // 3
    
    // до указанного количества знаком после
    let floatString = String(format: "%.3f", 1.34567) // "1.346"
    let floatNumber = Float(floatString) // 1.346

}

