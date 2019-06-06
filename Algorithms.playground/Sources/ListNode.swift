import Foundation




//作者：故胤道长
//链接：https://www.jianshu.com/p/cf962aeff643
//来源：简书
//简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。
//

class ListNode {


	var next: ListNode?

	var val: Int
	init(_ val: Int) {
		self.val = val
		self.next = nil
	}

}


class List {
	var head: ListNode?
	var tail: ListNode?

	// 尾插法
	func appendToTail(_ val: Int) {
		if tail == nil {
			tail = ListNode(val)
			head = tail
		} else {
			tail!.next = ListNode(val)
			tail = tail!.next
		}
	}

	// 头插法
	func appendToHead(_ val: Int) {
		if head == nil {
			head = ListNode(val)
			tail = head
		} else {
			let temp = ListNode(val)
			temp.next = head
			head = temp
		}
	}
}


func partition(_ head: ListNode?, _ x: Int) -> ListNode? {


	guard let head = head else {
		return nil
	}

	let leftDummy = ListNode.init(0)

	var leftList:ListNode? = leftDummy


	let rightDummy = ListNode.init(0)

	var rightList:ListNode? = rightDummy



	var node:ListNode? = head


	while node?.next != nil {

		if node!.val < x {
			leftList?.next = node
			leftList = leftList?.next
		}

		if node!.val >= x {
			leftList?.next = node
			leftList = rightList?.next
		}

		node = node?.next
	}


	leftList?.next = rightDummy.next
	leftList?.next = nil



	return leftDummy.next

}


