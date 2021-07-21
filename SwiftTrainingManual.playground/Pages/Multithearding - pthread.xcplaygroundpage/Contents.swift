/*:
 [Оглавление](HEADER)
 # pthread
 
 ### Описание
 
 POSIX threads - стандарт, входящих в состав POSIX, описывающий множество типов и функций, используемых для реализации потоков в UNIX-системах.
 
 ### Типы выполнения потоков
 * __Join__ - (синхронный, серийный) присоединенный поток. При использовании функции pthread_join текщий поток останавливается и дожидается завершения работы потока, переданного в функцию.
 * __Detach__ - (асинхронный, конкурентный) независимый поток. При использовании функции pthread_detach и установке аттрибута PTHREAD_CREATE_DETACHED текущий потом не ждет завершения работы переданного в функцию потока.
 */
import Foundation
//: ## Основные операции
//: __Создание и выполнение потока__
if true {
    var thread: pthread_t?
    // сразу после создания поток запускается
    pthread_create(&thread, nil, { _ in
        sleep(2)
        print("custom JOIN thread")
        return nil
    }, nil)

    //:  __Синхронное (join) выполнение потока__
    pthread_join(thread!, nil)
    print("Done #1")
    // Сообщение "custom JOIN thread" будет отображено до "Done #1"
}

//:  __Асинхронное (detach) выполнение потока__
// Создание аттрибута
var threadDetachAttr = pthread_attr_t()
pthread_attr_init(&threadDetachAttr)
pthread_attr_setdetachstate(&threadDetachAttr, PTHREAD_CREATE_DETACHED)
// Создание и исполнение потока
var detachThread: pthread_t?
pthread_create(&detachThread, &threadDetachAttr, { _ in
    sleep(1)
    print("custom DETACH thread")
    return nil
}, nil)
// Установка потока как detach
pthread_detach(detachThread!)
print("Done #2")
// Сообщение "Done #2" будет выведено до "custom DETACH thread"

//: ## Синхронизация
//: ### Mutex (pthread_mutex_t)
//: __Пример некорректного поведения без мьютекса (Race Condition)__

var firstThread: pthread_t?
var secondThread: pthread_t?
var sum = 0

pthread_create(&firstThread, nil, { _ in
    for _ in 1...10000 {
        sum += 1
    }
    return nil
}, nil)

pthread_create(&secondThread, nil, { _ in
    for _ in 1...10000 {
        sum += 1
    }
    return nil
}, nil)
pthread_join(firstThread!, nil)
pthread_join(secondThread!, nil)
print(sum)
// значение в консоли довольно часто будет отличаться от 20000

//: __Использование мьютексов для исправления ситуации__

var mutex = pthread_mutex_t()
pthread_mutex_init(&mutex, nil)

var firstThread2: pthread_t?
var secondThread2: pthread_t?
var sum2 = 0

pthread_create(&firstThread2, nil, { _ in
    for _ in 1...10000 {
        pthread_mutex_lock(&mutex)
        defer {
            // defer будет вызван в конце каждой иттерации
            pthread_mutex_unlock(&mutex)
        }
        sum2 += 1
    }
    return nil
}, nil)

pthread_create(&secondThread2, nil, { _ in
    for _ in 1...10000 {
        pthread_mutex_lock(&mutex)
        defer {
            // defer будет вызван в конце каждой иттерации
            pthread_mutex_unlock(&mutex)
        }
        sum2 += 1
    }
    return nil
}, nil)
pthread_join(firstThread2!, nil)
pthread_join(secondThread2!, nil)
print(sum2)

//: ### Condition

var available = false
var condition = pthread_cond_t()
var mutexCond = pthread_mutex_t()

pthread_cond_init(&condition, nil)
pthread_mutex_init(&mutexCond, nil)

var printerThread: pthread_t?
pthread_create(&printerThread, nil, { _ in
    print("Enter Printer")
    pthread_mutex_lock(&mutexCond)
    defer {
        pthread_mutex_unlock(&mutexCond)
    }
    if !available {
        pthread_cond_wait(&condition, &mutexCond)
    }
    available = false
    print("Exit Printer")
    return nil
}, nil)

var writerThread: pthread_t?
pthread_create(&writerThread, nil, { _ in
    print("Enter Writer")
    available = true
    pthread_cond_signal(&condition)
    
    print("Exit Writer")
    return nil
}, nil)

pthread_detach(printerThread!)
pthread_detach(writerThread!)

/*
 Вывод в консоль
 Enter Printer
 Enter Writer
 Exit Printer
 Exit Writer
 
 Две последние строки могут быть наоборот, тут кто быстрее закончит
 
 Printer проверяет значение флага и встает на ожидание, пока в condition не будет послан сигнал, а это делается во втором потоке
 
 
 */

//: ## Сигналы
//: __Создание маски сигналов для потока__
var sig = sigset_t()
// создание пустого множества
sigemptyset(&sig)
// создание заполненного множества
//sigfillset(&sig)
// добавленеи сигнала
sigaddset(&sig, SIGIO)
sigaddset(&sig, SIGILL)
// удаление сигнала
//sigdelset(&sig, SIGIO)
let mask = pthread_sigmask(SIG_BLOCK , &sig, nil)

//: __Отправка сигнала__
//pthread_kill(thread!, SIGIO)
