import Foundation




struct Foo {
    var age = 1
}

struct Value {
    var value: Int
}

class RefModel {
    var id: Int = 0
}

var source = Value(value: 3)
// Int - структура
// копируем экземпляр структуры
var copy = source
//copy.value = 7

var a = [1,2,3]
a[1]


//var sclass = RefModel()
//var cclass = sclass

withUnsafePointer(to: &a[1]) {
    print($0)
}

withUnsafePointer(to: &copy.value) {
    print($0)
}

withUnsafePointer(&source) {
     print( UnsafePointer($0) )
}


withUnsafeBytes(of: &sclass) {
    let a = Unmanaged<RefModel>.fromOpaque($0)
    print(a)
}



cclass.id = 6

ObjectIdentifier(sclass)
ObjectIdentifier(cclass)
sclass.id



func testCopyOnAssignment() {
   var var1 = Foo()
   var var2 = var1
    withUnsafePointer(to: &var1) {
        print("\($0)") // print address (Ex: 0x00007ffee6702fb0)
    }
    withUnsafePointer(to: &var2) {
        print("\($0)") // print different address (Ex: 0x00007ffee6702fa8)
    }
}

testCopyOnAssignment()

class Path {
    var value: String
    var left: Path?
    var right: Path?
    init(value: String, left: Path? = nil, right: Path? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

struct Maze  {
    var rootElement: Path
    init(root: String) {
        rootElement = Path(value: root)
    }
    var value: String {
        get {
            return rootElement.value
        }
        set {
            if !isKnownUniquelyReferenced(&rootElement) {
                rootElement = Path(value: newValue)
              return
            }
            rootElement.value = newValue
        }
    }
}

func testCopyOnWrite() {
        var maze1 = Maze(root: "1")
        var maze2 = maze1
        // Check if the two objects have the same address.
        print(maze1.rootElement === maze2.rootElement)    // print true
        maze2.value = "2"
        // Check if the two objects have the same address.
        print(maze1.rootElement === maze2.rootElement)    // print false
}

func testCopyOnAssignment2() {
   var var1 = Path(value: "444")
   var var2 = var1
    withUnsafePointer(to: &var1) {
        print("\($0)") // print address (Ex: 0x00007ffee6702fb0)
    }
    withUnsafePointer(to: &var2) {
        print("\($0)") // print different address (Ex: 0x00007ffee6702fa8)
    }
}

testCopyOnWrite()

testCopyOnAssignment2()








struct Value {
    var value: Int
}

class RefModel {
    var id: Int = 0
}

var source = Value(value: 3)
// Int - структура
// копируем экземпляр структуры
var copy = source
copy.value = 7

var sclass = RefModel()
var cclass = sclass

func print<T>(address p: UnsafeRawPointer, as type: T.Type) {
    let value = p.load(as: type)
    print(value)
}

print(address: &sclass, as: RefModel.self)

withUnsafeBytes(of: source) {
    print($0)
}

var a = 2

withUnsafeBytes(of: a) {
    print($0)
}



withUnsafeBytes(of: &source) {
    var value = $0.load(as: Value.self)
    $0.cop
    value.value = 5
    print(value)
}

source.value

withUnsafeBytes(of: source) { val in
    print($0)
}

source

withUnsafeBytes(of: source) {
    ($0 as! Value).value = 5
}


print(address: &source, as: Int.self)

// Выводим адрес в памяти
withUnsafePointer(to: source) {
    print($0) // текущий адрес, например 0x00007ffee6b8d2a0
}

withUnsafePointer(to: copy) {
    print($0) // другое значение, например 0x00007ffee6b8d2a0
}

class SomeClass {
    var a: Int = 0
}

var sourceClass = SomeClass()
var copyClass = sourceClass

// Выводим адрес в памяти
withUnsafePointer(to: sourceClass) {
    print($0) // текущий адрес, например 0x00007ffeef4422a0
}

withUnsafePointer(to: copyClass) {
    print($0) // другое значение, например 0x00007ffeef4422a0
}



