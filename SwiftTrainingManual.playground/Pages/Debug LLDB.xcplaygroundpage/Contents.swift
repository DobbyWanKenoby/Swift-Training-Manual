/*:
 [Оглавление](HEADER)
 # LLDB
 
 Низкоуровневый дебагер, доступный в консоли Xcode в процессе исполнения приложения
 
 __Получение доступа к LLDB для ввода команд:__
 - Приостановить приложение
 - В консоли будет выведено (lldb), значит можно вводить команды
 - При вводе команд можно получать доступ к текущим доступным параметрам (будет доступно автодополнение для удобства)
 
 */

//: ### Команды

//: __Получение значения параметра__
print name
po name
expression name

//: __Изменение значения параметра__
expression name = value
