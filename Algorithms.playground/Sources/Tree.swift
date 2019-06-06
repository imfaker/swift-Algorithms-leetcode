import Foundation



// 一颗二叉搜索树的  search，min，max，successor，predecessor的都可以 在 O(h)时间内完成
public class TreeNode {

	public var val: Int

	public var leftNode: TreeNode?

	public var rightNode: TreeNode?
	public var parent: TreeNode?


	public init(_ val: Int) {
		self.val = val
	}




}
// 计算树的最大深度
public func maxDepth(root: TreeNode?) -> Int {

	guard let root = root else {
		return 0
	}

	return max(maxDepth(root: root.rightNode), maxDepth(root: root.leftNode)) + 1

}


// 判断一颗二叉树是否为二叉查找树
public func isValidBST(root: TreeNode?) -> Bool {
	return _helper(node: root, nil, nil)
}



// max 用于遍历左子树 ， min 用于遍历右子树
private func _helper(node: TreeNode?, _ min: Int?, _ max: Int?) -> Bool {


	guard let node = node else {

		return true

	}
	if let min = min, min > node.val {

		return false

	}

	if let max = max, max < node.val {

		return false

	}


	return _helper(node: node.leftNode, min, node.val) && _helper(node: node, node.val, max)


}




// 用栈实现的前序遍历
func preorderTraversal(root: TreeNode?) -> [Int] {
	var res = [Int]()
	var stack = [TreeNode]()
	var node = root



	//先输出了 根节点 ，再往下搜寻左节点， stack用于记录查找右节点
	while !stack.isEmpty || node != nil {
		if node != nil {
			res.append(node!.val)
			stack.append(node!)
			node = node!.leftNode
		} else {
			node = stack.removeLast().rightNode
		}
	}

	return res
}



func inOrderTraversal(root: TreeNode?) -> [Int] {
	var res = [Int]()
	var stack = [TreeNode]()
	var node = root

	//先输出了 根节点 ，再往下搜寻左节点， stack用于记录查找右节点
	while !stack.isEmpty || node != nil {

		if node != nil {

			stack.append(node!)
			node = node!.leftNode

		} else {

			let removenode = stack.removeLast()
			res.append(removenode.val)

			node = removenode.rightNode

		}

	}

	return res
}




//前序遍历
public func preOrderTraverse(arr: inout [Int], node: TreeNode?) -> [Int] {

	guard let node = node else {

		return arr

	}

	if let leftNode = node.leftNode {

		arr.append(contentsOf: preOrderTraverse(arr: &arr, node: leftNode))

	}

	arr.append(node.val)

	if let rightNode = node.rightNode {

		arr.append(contentsOf: preOrderTraverse(arr: &arr, node: rightNode))

	}


	return arr

}

//中序遍历
public func inOrderTraverse(arr: inout [Int], node: TreeNode?) -> [Int] {

	guard let node = node else {

		return arr

	}
	if let leftNode = node.leftNode {

		arr.append(contentsOf: inOrderTraverse(arr: &arr, node: leftNode))

	}

	arr.append(node.val)

	if let rightNode = node.rightNode {

		arr.append(contentsOf: inOrderTraverse(arr: &arr, node: rightNode))

	}

	return arr

}


public func postOrderTraverse(node: TreeNode?) -> [Int] {
	var arr = [Int]()
	return _postOrderTraverse(arr: &arr, node: node)
}

//后序遍历
private func _postOrderTraverse(arr: inout [Int], node: TreeNode?) -> [Int] {

	guard let node = node else {

		return arr

	}

	if let leftNode = node.leftNode {

		arr.append(contentsOf: _postOrderTraverse(arr: &arr, node: leftNode))

	}

	arr.append(node.val)

	if let rightNode = node.rightNode {

		arr.append(contentsOf: _postOrderTraverse(arr: &arr, node: rightNode))

	}


	return arr

}




// 非递归实现

private func _postOrderNotTraverse(arr: inout [Int], node: TreeNode?) -> [Int] {

	guard let node = node else {
		return [Int]()
	}

	var stack: [TreeNode] = [TreeNode]()


	var out: [Int] = [Int]()

	var nextNode: TreeNode? = node

	var prePopStackNode: TreeNode?


	stack.append(node)

	///  将所有 结点 依次押入 栈内，左边后放入，这样出栈时左边先出，再是右边，再是父节点， 然后依次出栈判断，情况两种
	///1.没有孩子
	///2.加入prenode 用于 判断 上一个出栈的 是否是 他的孩子，是的话 就说明他的孩子 已经输出完毕，可以输出他了"
	while stack.first != nil {
		nextNode = stack.first
		if (nextNode?.leftNode == nil && nextNode?.leftNode == nil) || (prePopStackNode != nil && (prePopStackNode === nextNode?.leftNode || prePopStackNode === nextNode?.rightNode)) {

			out.append(nextNode!.val)
			let _ = stack.popLast()

			prePopStackNode = nextNode

		} else {

			if let leftNode = nextNode?.rightNode {
				stack.append(leftNode)
			}
			if let rightNode = nextNode?.rightNode {
				stack.append(rightNode)
			}

		}

	}
	return out


}







///层级遍历
public func _levelOrderTraverse(node: TreeNode?) -> [Int] {

	var arr = [Int]()
	return _levelOrderTraverse(arr: &arr, node: node)
}





private func _levelOrderTraverse(arr: inout [Int], node: TreeNode?) -> [Int] {


	guard let node = node else {
		return arr
	}

	var queue: [TreeNode] = [TreeNode]()

	while queue[0] != nil {

		arr.append(queue[0].val)

		queue.remove(at: 0)

		if let left = queue[0].leftNode {
			queue.append(left)
		}

		if let right = queue[0].rightNode {
			queue.append(right)
		}



	}


	return queue.map({ (treeNode) -> Int in
		treeNode.val
	})

}


// 另外种写法   用的queue    其实层级遍历就是图的广度优先遍历，而广度优先遍历很自然就会用到队列
func levelOrder(root: TreeNode?) -> [[Int]] {
	var res = [[Int]]()
	// 用数组来实现队列
	var queue = [TreeNode]()

	if let root = root {
		queue.append(root)
	}

	while queue.count > 0 {
		var size = queue.count
		var level = [Int]()

		for _ in 0 ..< size {
			let node = queue.removeFirst()

			level.append(node.val)
			if let left = node.leftNode {
				queue.append(left)
			}
			if let right = node.leftNode {
				queue.append(right)
			}
		}
		res.append(level)
	}

	return res
}

//快行指针
//
//笔者理解快行指针，就是两个指针访问链表，一个在前一个在后，或者一个移动快另一个移动慢，这就是快行指针。所以如何检测一个链表中是否有环？用两个指针同时访问链表，其中一个的速度是另一个的2倍，如果他们相等了，那么这个链表就有环了。代码如下：


func hasCycle(_ head: ListNode?) -> Bool {

	var slow = head
	var fast = head

	while fast != nil && fast!.next != nil {
		slow = slow!.next
		fast = fast!.next!.next

		if slow === fast {
			return true
		}
	}

	return false


}

func removeNthFromEnd(head: ListNode?, _ n: Int) -> ListNode? {
	guard let head = head else {
		return nil
	}

	let dummy = ListNode(0)
	dummy.next = head
	var prev: ListNode? = dummy
	var post: ListNode? = dummy

	// 设置后一个节点初始位置
	for _ in 0 ..< n {
		if post == nil {
			break
		}
		post = post!.next
	}

	// 同时移动前后节点
	while post != nil && post!.next != nil {
		prev = prev!.next
		post = post!.next
	}

	// 删除节点
	prev!.next = prev!.next!.next

	return dummy.next
}

//一定要注意头结点可能就是nil。所以给定链表，我们要看清楚head是不是optional，在判断是不是要处理这种边界条件。
//注意每个节点的next可能是nil。如果不为nil，请用"!"修饰变量。在赋值的时候，也请注意"!"将optional节点传给非optional节点的情况。
