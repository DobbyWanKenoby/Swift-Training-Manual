/*:
 [Оглавление](HEADER)
 # Autorelease Pool

 Особый объект, который хранит в себе ссылки на объекты, помеченные с помощью autorelese.
 
 * Во времена ObjC управление памятью было ручным (ARC есть лишь в Swift). Для изменения счетчика ссылок на объект использовались различные методы: new, copy, release... Каждый из методов изменяет значение счетчика ссылок немедленно, в частности release уменьшает его на 1 сразу после использования. В некоторых случаях требуется отложить уменьшение счетчика, например при возвращении некоторого объекта из некоторой функции. Так, если в конце функции вызвать relese у возвращаемого объекта, то он будет уничтожен еще до того, как функция завершит работу. Но нам требуется, чтобы объект продолжал жить даже после завершения работы функции. Для таких ситуаций (когда нужно отложить уменьшение счетчика ссылок) существует метод autorelease. При его использовании вместо release данный объект помечается, как требующий уменьшения счетчика ссылок, но не сейчас, а несколько позже.
 * Помеченный с помощью autorelease объект помещается в специальный Autorelease pool
 * Autorelease pool обрабатывает все хранящиеся в нем объекты (уменьшает их счетчик ссылок) в конце иттерации RunLoop
 * Для очищения autorelease pool вызывается его метод drain.
 * Autoreleasepool автоматически создается в начале RunLoop и удаляется в конце иттерации. При этом вызывается метод drain.
 * Сегодня существует ARC и autorelease pool напрямую может использоваться только для ObjC-объектов, или объектов, помеченных с помощью аттрибута @autorelease (например UIImage). В большинстве случаев вам не стоит думать о нем, Swift все делает автоматически.
 */

import Foundation
import CoreFoundation
import UIKit

//: __Кастомное использование autoreleasepool__
autoreleasepool {
    // ...
}

// пример
// все параметры image всех иттераций цикла будут храниться до конца жизни потока, хотя в этом нет необходимости
for i in 1...1000 {
    let image = UIImage(named: "\(i).jpg")
    // ... сохранение файла в БД
    // по сути image больше не нужен
}

// с помощью autoreleasepool значение параметр image будет удаляться в конце каждой иттерации цикла
for i in 1...1000 {
    autoreleasepool {
        let image = UIImage(named: "\(i).jpg")
        // ... сохранение файла в БД
    }
}
