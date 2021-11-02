# Многопоточность (Multitherading)

[К оглавлению](./README.md)

## Структура раздела
- [Описание](#desc)

## <a id="desc"></a>Описание

`class Thread : NSObject`

Класс `Thread` служит для "ручного" создания потоков и управления их выполнением. Позволяет исполнять ObjC-методы и замыкания без параметров. Является оберткой над pthreads.
 * Все потоки создаются Detach

### Типы данных

### Тип 1

### Тип 2

## Операции

### Инициализация

### Другие операции

## Дополнительная информация

*:
 [Оглавление](HEADER)
 # Thread class

 
 ### Описание
 
 * Класс служит для создания потоков и управления их выполнением.
 * Позволяет исполнять ObjC-методы и замыкания без параметров.
 * Обертка над pthreads.
 * Все потоки создаются Detach
 
 ### Почему лучше использовать другие механизмы
 
 * Thread завязан на Objective-C runtime
 * Ручное создание и удаление потоков - очень затратная операция. У GCD, к примеру, изначально есть пул потоков, которые он использует в автоматическом режиме.
 
 */
import Foundation

//: ## Основные операции
//: __Получить основной поток__
let mainthread = Thread.main
mainthread.isMainThread // true
//: __Создать собственный поток__
var customThread = Thread()
customThread.name = "Thread fo background tasks"
customThread.qualityOfService = .background
customThread.isMainThread // false
//: __Запустить поток__
customThread.start()
//: __Пометить поток, как завершенный__
customThread.isCancelled // false
customThread.cancel()
customThread.isCancelled // true
//: __Создание кастомного класса для потока__
class MyThread: Thread {
    override func start() {
        super.start()
        print("Start method did execute")
    }
    
    override func main() {
        super.main()
        print("Main method did execute")
    }
}

let myThread = MyThread(block: {
    print("execute some block")
})
myThread.start()
//: __Выполнение замыкания на потоке__
// вариант 1
let blockThread = Thread {
    print("Do some work")
}
blockThread.start()

// вариант 2
// запускает сразу
Thread.detachNewThread {
    for _ in 1...3 {
        print("Hello!")
    }
}
//: __Выполнение метода с селектором на потоке__
class WorkWrapper {
    
    // sleep time in seconds
    var period: UInt32
    // thread
    lazy var thread = {
        Thread(target: self, selector: #selector(run), object: nil)
    }()
    
    init(period: UInt32) {
        self.period = period
    }
    
    func startWork() {
        thread.start()
    }
    
    // Obj-C method
    @objc func run(msg: String) {
        for i in 1...10 {
            print("msg is \(i)")
            
            //  Остановка выполнения потока
            if i == 6 {
                Thread.current.cancel()
            }
            if Thread.current.isCancelled {
                return
            }
            sleep(period)
        }
    }
}

let operation1 = WorkWrapper(period: 3)
operation1.startWork()
let operation2 = WorkWrapper(period: 1)
operation2.startWork()

/*
 Every 3 seconds operation1 print message to console
 Every 1 second operation2 print message to console
 
 msg is 1 - operation1
 msg is 1 - operation2
 msg is 2 - operation2
 msg is 3 - operation2
 msg is 2 - operation1
 msg is 4 - operation2
 msg is 5 - operation2
 msg is 6 - operation2
 msg is 3 - operation1
 ...
 */

//: __Отмена выполнения потока__

myThread.cancel()
// при этом поток не останавливается
// вместо этого свойство isCancelled переводится в true
myThread.isCancelled // true
// внутри потока можно проверить его значение и произвести выход из функции
// при этом сохранив все необходимые данные
