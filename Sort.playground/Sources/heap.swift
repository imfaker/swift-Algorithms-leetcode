import Foundation



// 数组从0开始
public struct Heap {


	private let _nums: [Int]


	public var heapArray: [Int] = [Int]()


	public init(nums: [Int]) {
		_nums = nums

		//	heapArray =  Heap.buildMaxHeaped(nums)

	}


	//O(nlgn)
	public static func sorted(_ nums: [Int]) -> [Int] {

		var maxHeapNum = Heap.buildMaxHeaped(nums)


		for i in (1...(maxHeapNum.count - 1)).reversed() {
			maxHeapNum.swapAt(0, i)

			Heap.maxHeapify(&maxHeapNum, i: 0, count: maxHeapNum.count - i)
		}
		return maxHeapNum
	}

	/// O(n)
	public static func buildMaxHeaped(_ nums: [Int]) -> [Int] {

		var num = nums
		let count = num.count
		for i in (0...(count / 2 - 1)).reversed() {
			Heap.maxHeapify(&num, i: i, count: count)
		}
		return num
	}

	//维护最大堆的性质 O(lgn) = O(h)
	public static func maxHeapify(_ nums: inout [Int], i: Int, count: Int)  {



		var largestI = i
		if i.leftChild < count && nums[i] < nums[i.leftChild] {

			largestI = i.leftChild
		}

		if i.rightChild < count && nums[largestI] < nums[i.rightChild] {
			largestI = i.rightChild
		}

		if largestI != i {

			nums.swapAt(i, largestI)
			maxHeapify(&nums, i: largestI, count: count)
		}


	}


}


private extension Int { var leftChild: Int {
	return (2 * self) + 1
}

	var rightChild: Int {
		return (2 * self) + 2
	}

	var parent: Int {
		return (self - 1) / 2
	}
}
