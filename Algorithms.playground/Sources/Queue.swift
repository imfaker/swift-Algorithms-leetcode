import Foundation
//public protocol Queue {
//	/// 持有的元素类型
//	associatedtype Element
//
//	/// 是否为空
//	var isEmpty: Bool { get }
//	/// 栈的大小
//	var size: Int { get }
//	/// 栈顶元素
//	var peek: Element? { get }
//
//	/// 入队
//	mutating func enqueue(_ newElement: Element)
//	/// 出队
//	mutating func dequeue() -> Element?
//}
//

fileprivate extension Array {


}

//
//public class LimitArrayQueue<T>: Queue {
//	typealias Element = Int
//
//	public var isEmpty: Bool { return left.isEmpty && right.isEmpty }
//	public var size: Int { return left.count + right.count }
//	public var peek: Element? { return left.isEmpty ? right.first : left.last }
//
//
//	public var head: Int = 0
//	public var tail: Int = 0
//	private var arr: [T]
//	private let limitCount: Int
//	init(limitCount: Int) {
//		self.limitCount = limitCount
//		arr = Array.init(repeating: 0, count: limitCount)
//	}
//
//	public mutating func enqueue(_ newElement: Element) -> Bool {
//
//
//		var tmpTail = tail
//		if tail == (arr.count - 1) {
//			tail = 0
//		} else {
//			tail += 1
//		}
//
//		if tail == head {
//			return false
//		}
//
//		tail = tmpTail
//		arr[tail] = newElement
//		return true
//	}
//
//	public mutating func dequeue() -> Element? {
//
//		if tail == head {
//			return nil
//		}
//
//
//		if head == 0 {
//			head = limitCount - 1
//		}
//		return arr[head]
//	}
//}
//
////
////
//public class IntQueue: Queue {
//	typealias Element = Int
//
//	public var isEmpty: Bool { return left.isEmpty && right.isEmpty }
//	public var size: Int { return left.count + right.count }
//	public var peek: Element? { return left.isEmpty ? right.first : left.last }
//
//	private var left = [Element]()
//	private var right = [Element]()
//
//	public mutating func enqueue(_ newElement: Element) {
//		right.append(newElement)
//	}
//
//	public mutating func dequeue() -> Element? {
//		if left.isEmpty {
//			left = right.reversed()
//			right.removeAll()
//		}
//		return left.popLast()
//	}
//}
//
//struct MyQueue {
//	var stackA: Stack
//	var stackB: Stack
//
//	var isEmpty: Bool {
//		return stackA.isEmpty && stackB.isEmpty;
//	}
//
//	var peek: Any? {
//		get {
//			shift();
//			return stackB.peek;
//		}
//	}
//
//	var size: Int {
//		get {
//			return stackA.size + stackB.size
//		}
//	}
//
//	init() {
//		stackA = Stack()
//		stackB = Stack()
//	}
//
//	func enqueue(object: Any) {
//		stackA.push(object);
//	}
//
//	func dequeue() -> Any? {
//		shift()
//		return stackB.pop();
//	}
//
//	fileprivate func shift() {
//		if stackB.isEmpty {
//			while !stackA.isEmpty {
//				stackB.push(stackA.pop()!);
//			}
//		}
//	}
//}


//队列实现栈  pop 就是 将要dequeue的元素前的 元素转移到另一个队列里  。这时 原duqueue只剩要pop的元素,在 swap两个队列的角色
//
//struct MyStack {
//	var queueA: Queue
//	var queueB: Queue
//
//	init() {
//		queueA = Queue()
//		queueB = Queue()
//	}
//
//	var isEmpty: Bool {
//		return queueA.isEmpty && queueB.isEmpty
//	}
//
//	var peek: Any? {
//		get {
//			shift()
//			let peekObj = queueA.peek
//			queueB.enqueue(queueA.dequeue()!)
//			swap()
//			return peekObj
//		}
//	}
//
//	var size: Int {
//		return queueA.size
//	}
//
//	func push(object: Any) {
//		queueA.enqueue(object)
//	}
//
//	func pop() -> Any? {
//		shift()
//		let popObject = queueA.dequeue()
//		swap()
//		return popObject
//	}
//
//	private func shift() {
//		while queueA.size != 1 {
//			queueB.enqueue(queueA.dequeue()!)
//		}
//	}
//
//	private func swap() {
//		(queueA, queueB) = (queueB, queueA)
//	}
//}
