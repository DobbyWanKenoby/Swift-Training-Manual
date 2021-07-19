import Foundation
/*:
 # Grand Central Dispatch (GCD)
 
 ### Описание
 
 * GCD позволяет уйти от потоков и работать с абстракцией очередей задач.
 * Распределение задач по потоком происходит в автоматическом режиме.
 * GCD имеет пул потоков, с которыми и работает.
 * GCD имеет несколько заранее созданных (5 global и 1 main) очередей, с которыми можно работать. Но можно создавать и собственные очереди
 */

//: ## Основные операции
//: __Создание очередей__
// последовательная очередь
let serialQueue = DispatchQueue(label: "serial")
// параллельная очередь
let concurrentQueue = DispatchQueue(label: "concurrent", attributes: .concurrent)

//: __Получение существующих очередей__
// глоабальная очередь
let globalQueue = DispatchQueue.global()
let globalQueueBackground = DispatchQueue.global(qos: .background)
// основная очередь
let mainQueue = DispatchQueue.main


