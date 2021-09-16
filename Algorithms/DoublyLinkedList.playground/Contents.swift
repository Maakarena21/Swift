import UIKit


/*
 Двусвязный список - это вариант связанного списка, который может перемещаться в обоих направлениях, при этом узел содержит указатель, указывающий на предыдущий, и другой указатель, указывающий на следующий узел в списке. Следовательно, в двусвязном списке узел состоит из трех частей: данных, следующего указателя и предыдущего указателя.
 
 */
// Node - узел

/*
 
 класс Node состоит из трех частей: значение (данные), следующая и предыдущая (ссылки). Прежде чем
 класс узла соответствует двум протоколам
 */

class Node<T>: CustomStringConvertible, Equatable {
    
    var value: T
    var next: Node<T>?
    weak var prev: Node<T>?
    
    
    var description: String {
        guard let next = next else { return "\(value)" }
        return "\(value) -> " + String(describing: next)
    }
    
    init(_ value: T, prev: Node<T>?, next: Node<T>?) {
        self.value = value
        self.prev = prev
        self.next = next
    }
    
    
    static func ==(lhs: Node, rhs: Node) -> Bool {
        return lhs.next == rhs.next
    }
}

/*
 Типы, соответствующие CustomStringConvertibleпротоколу, могут предоставлять собственное представление, которое будет использоваться при преобразовании экземпляра в строку. String(describing:)Инициализатор является предпочтительным способом для преобразования экземпляра любого типа в строку. Если переданный экземпляр соответствует CustomStringConvertible, String(describing:)инициализатор и print(_:)функция используют настраиваемое description свойство экземпляра .
 
 Типы, соответствующие Equatableпротоколу, можно сравнивать на равенство с помощью оператора равенства ( ==) или неравенства с помощью оператора неравенства ( !=). Большинство основных типов в стандартной библиотеке Swift соответствуют Equatable.
 
 */

// двусвязный список класс

class DoublyLinkedList<T>: CustomStringConvertible {
    
    var head: Node<T>? = nil
    var tail: Node<T>? = nil
    
    
    var isCirculated: Bool {
        
    }
    var isEmpty: Bool {
        head == nil
    }
    
    
    var description: String {
        guard let head = head else { return "Empty List !!!" }
        return String(describing: head)
    }
    
    init() {
        head = nil
        tail = head
    }
    
    func deleteAll() {
        head = nil
        tail = nil
    }
}

// Доступ к узлу с использованием индекса и получение значений в прямом / обратном направлении

// общие операции
extension DoublyLinkedList {
    
    var first: Node<T>? {
        head
    }
    
    var last: Node<T>? {
        tail
    }
    
    // для доступа к узлу используется опция индекса, т. е. [индекс]
    /*
    как можем получить доступ к узлу с помощью индекса и получить все значения списка в прямом и обратном направлении.

    можем получить доступ к любому узлу из индекса с помощью ключевого слова subscript.
     forwardValues ​​(): Используя ссылку "head", получим все значения списка.
     backwardValues ​​(): Используя «хвостовую» ссылку, получим все значения списка.
     
     
     */
    subscript(index: Int) -> Node<T>? {
        node(at: index)
    }
    
    // получить все значения в прямом направлении
    var forwardValues: [T]? {
        if isEmpty { return nil }
        var values: [T] = []
        var currentNode = head
        while currentNode != nil {
            values.append(currentNode!.value)
            currentNode = currentNode?.next
        }
        return values
    }
    
    // получить все значения в обратном направлении
    
    
    
    var backwardValues: [T]? {
        if let tailNode = tail {
            var values: [T] = []
            var previousNode = tailNode
            repeat {
                values.append(previousNode.value)
                if let previous = previousNode.prev {
                    previousNode = previous
                }
            } while previousNode.prev != nil
            return values
        }
        return nil
    }
    
    // Доступ к узлу из определенного индекса и длины списка


    /*
     node (at :): чтобы получить узел из определенного индекса.
     length (): чтобы получить общее количество подключенных узлов в списке
     
     */
    
    // получить узел из определенной позиции
    func node(at index: Int) -> Node<T>? {
        
        // если список пуст, то вернуть нил
        if isEmpty { return nil }
        
        if index >= 0 {
            var currentNode = head
            var currentIndex = 0
            while currentNode != nil && currentIndex < index {
                currentNode = currentNode?.next
                currentIndex += 1
            }
            return currentNode
        }
        return nil
    }
    
    func length() -> Int {
        var currentNode = head
        var length = 0
        while currentNode != nil {
            length += 1
            currentNode = currentNode?.next
        }
        return length
    }
}

// операции вставки
extension DoublyLinkedList {
    
    // вставить в начале
    func push(_ value: T) {
        if isEmpty {
            head = Node(value, prev: nil, next: nil)
            tail = head
        } else {
            let newNode = Node(value, prev: nil, next: head)
            head?.prev = newNode
            head = newNode
        }
    }
    
    // вставить в конце
    func append(_ value: T) {
        let newNode = Node(value, prev: nil, next: nil)
        if let tail = tail {
            newNode.prev = tail
            tail.next = newNode
        } else {
            head = newNode
        }
        tail = newNode
    }
    
    // вставить значение после по заданному индексу
    func insert(after index: Int, value: T) -> Bool {
        if let node = node(at: index) {
            
            if node == tail {
                append(value)
                return true
            }
            
            let newNode = Node(value, prev: node, next: node.next)
            if let oldNextNode = node.next {
                node.next = newNode
                oldNextNode.prev = newNode
                return true
            }
        }
        return false
    }
}

// Удаление (удалить, удалить последнее, удалить из определенного индекса)


// операции удаления
extension DoublyLinkedList {
    
    // удалить первый элемент в списке
    @discardableResult
    func pop() -> T? {
        defer {
            head = head?.next
            head?.prev = nil
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    // удалить последний элемент в списке
    @discardableResult
    func deleteLast() -> T? {
        guard var tailNode = tail, var headNode = head else { return nil }
        defer {
            if tailNode == headNode {
                tail = nil
                head = nil
            } else if let prev = tailNode.prev {
                tail = prev
                tail?.next = nil
            }
        }
        return tailNode.value
    }
    
    // удалить элемент из определенной позиции
    func remove(at index: Int) -> T? {
        if let node = self.node(at: index) {
            
            if node == head {
                return pop()
            }
            
            if node == tail {
                return deleteLast()
            }
            
            defer {
                let prev = node.prev
                let next = node.next
                prev?.next = node.next
                next?.prev = node.prev
            }
            return node.value
        }
        return nil
    }
}


var stringList = DoublyLinkedList<String>()
stringList.push("one")
stringList.push("two")
stringList.push("three")
stringList.append("four")
stringList.insert(after: 2, value: "five")
stringList.pop()
print(stringList)

// просканировал весь список и понять есть ли закругление
