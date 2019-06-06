
protocol Stack {


	associatedtype Element



	/// 是否为空
	var isEmpty: Bool { get }
	/// 栈的大小
	var size: Int { get }
	/// 栈顶元素
	var peek: Element? { get }


	//mutating func popAll()

	mutating func push(_ element: Element)
	mutating func pop() -> Element?
}



struct StackClass<T>: Stack {
	typealias Element = T
	private var stack: [Element] = [Element]()

	var isEmpty: Bool { return stack.isEmpty }
	var size: Int { return stack.count }
	var peek: Element? { return stack.last }

	mutating func push(_ element: Element) {

		stack.append(element)

	}
	mutating func pop() -> Element? {
		return stack.dropLast() as! T
	}


}
