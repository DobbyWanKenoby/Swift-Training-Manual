// MARK: - ПРОТОКОЛЫ

protocol Valuable {
    associatedtype Value
    var value: Value { get set }
}

protocol NextElementLinkable {
    var next: NextElementLinkable? { get set }
}

// MARK: - РЕАЛИЗАЦИИ

// Узел в связанном списке
class Node<Value>: Valuable, NextElementLinkable {
    var value: Value
    var next: NextElementLinkable?

    required init(_ value: Value) {
        self.value = value
    }
}

// Линкованный список на основе структуры
struct LinkedList<Element: NextElementLinkable & Valuable>: Sequence, IteratorProtocol {

    typealias Iterator = Self

    private var firstNode: Element?
    private var currentItterateNode: Element? = nil
    private var lastNode: Element?

    __consuming func makeIterator() -> Self {
        return self
    }

    mutating func append(_ e: Element) {
        lastNode?.next = e
        lastNode = e
        if firstNode == nil {
            firstNode = e
        }
    }

    mutating func next() -> Element? {
        guard let current = currentItterateNode else {
            currentItterateNode = firstNode
            return currentItterateNode
        }
        guard let next = current.next else {
            return nil
        }
        currentItterateNode = next as? Element
        return next as? Element
    }

}

// MARK: - ДЕМОНСТРАЦИЯ

typealias NodeType = Node<Int>
var list = LinkedList<NodeType>()
list.append(NodeType(11))
list.append(NodeType(12))
list.append(NodeType(13))

for i in list {
    print(i.value)
}
