import Foundation
/*:
 # NSCondition
 
 ## Описание
 * Позволяет поставить выполнение некоторого потока на паузу до тех пор, пока не будет отправлен сигнал о выполнении некоторого условия. После этого выполнение инструкций на потоке будет продолжено
 * Обертка над pthread_cond_t
 
 */
//: ### Использование NSCondition
//: Класс имеет два метода, в каждом из которых создается собственный поток. Метод printData не должен выводить данные до того, как они будут записаны. Поэтому в нем производится провекра значения флага и при необходимости поток ставится на паузу с помощью метода NSCondition.wait до тех пор, покак метод writeData не запишет данные и не отправит в NSCondition сигнал о том, что можно продолжить выполнение

// Класс дял создания области видимости
class ConditionScope {
    
    let condition = NSCondition()
    // тут хранится условие продолжения выполнения
    var available = false
    
    func printData(){
        let thread = Thread {
            print("start Printer")
            self.condition.lock()
            defer {
                self.condition.unlock()
            }
            if !self.available {
                self.condition.wait()
            }
            print("end Printer")
        }
        thread.start()
    }
    
    func writeData() {
        let thread = Thread {
            print("start Writer")
            self.condition.lock()
            defer {
                self.condition.unlock()
            }
            self.available = true
            self.condition.signal()
            print("end Writer")
        }
        thread.start()
    }
}

let conditionInstance = ConditionScope()
conditionInstance.printData()
conditionInstance.writeData()
