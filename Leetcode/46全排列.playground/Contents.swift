import UIKit



/// 这个 问题 不错
///
/// - Parameter nums: <#nums description#>
/// - Returns: <#return value description#>
func productExceptSelf(_ nums: [Int]) -> [Int] {

	var arr = Array.init(repeating: 1, count: nums.count)

	for i in (0..<(nums.count - 1)).reversed() {

		arr[i] = arr[i + 1] * nums[i + 1]

	}
	var left = 1
	for i in 0..<nums.count {
		if i == 0 {
			arr[i] = left * arr[i]
		} else {
			left = left * nums[i - 1]
			arr[i] = left * arr[i]
		}


	}




	let leftArr = arr.reversed().reduce(1) { (result, value) -> Int in
         return result  *  value
	}

	let rightArr = arr.reduce(1) { (result, value) -> Int in
		return result  *  value
	}



	return  arr


//
//	for i in 1..<nums.count {
//		leftArr[i] = leftArr[i - 1] * nums[i - 1]
//
//	}
//
//
//	for i in (0..<(nums.count - 1)).reversed() {
//
//		riightArr[i] = riightArr[i + 1] * nums[i + 1]
//
//	}
//
//	for i in 0..<nums.count {
//
//		arr[i] = leftArr[i] * riightArr[i]
//	}

	return arr



}

productExceptSelf([1, 2, 3, 4])

func maxSubArray(_ nums: [Int]) -> Int {

	var sum = nums[0]
	var sumPre = nums[0]
	for i in 1...nums.count {
		sumPre = max(sumPre, sumPre + nums[i])
		sum = max(sum, sumPre)
	}
	return sum



}

func maxProduct(_ nums: [Int]) -> Int {


	var minNow = nums[0]
	var maxNow = nums[0]

	var result = nums[0]


	for i in 1..<nums.count {


		let a = (nums[i] * minNow)
		let b = (nums[i] * maxNow)


		minNow = min(nums[i], a, b)
		maxNow = max(nums[i], a, b)

//		resultCurrent = max(nums[i], resultCurrent * nums[i])

		result = max(result, maxNow)

	}

	return result
}
func maximalSquareStander(_ matrix: [[Character]]) -> Int {

	var maxLenth = 0
	let colum = matrix.count
	if colum < 1 {
		return maxLenth * maxLenth
	}

	let lie = matrix[0].count
	if lie < 1 {
		return maxLenth * maxLenth
	}
	var arr = Array.init(repeating: Array.init(repeating: 0, count: lie + 1), count: colum + 1)

	for i in 1...colum {
		for j in 1...lie {


			if matrix[i - 1][j - 1] == "1" {

				arr[i][j] = 1 + min(arr[i - 1][j - 1], min(arr[i][j - 1], arr[i - 1][j]))
				maxLenth = max(arr[i][j], maxLenth)
			}


		}


	}
	return maxLenth * maxLenth
}

func maximalSquare(_ matrix: inout [[Character]]) -> Int {


	var maxLenth = 0
	let colum = matrix.count
	if colum < 1 {
		return maxLenth * maxLenth
	}
	let lie = matrix[0].count
	if lie < 1 {
		return maxLenth * maxLenth
	}
//	var arr = Array.init(repeating: Array.init(repeating: 0, count: lie + 1), count: colum + 1)

	for i in 1...colum {
		for j in 1...lie {


			if matrix[i - 1][j - 1] == "0" {


			} else {

				let topLeftNUm = Int.init(String.init(matrix[i - 1][j - 1])) ?? 0

				let topNUm = Int.init(String.init(matrix[i][j - 1])) ?? 0
				let leftNUm = Int.init(String.init(matrix[i - 1][j])) ?? 0


				let newNum = 1 + min(topLeftNUm, min(topNUm, leftNUm))

				matrix[i][j] = Character.init(String(newNum))
				maxLenth = max(newNum, maxLenth)
			}

		}


	}
	return maxLenth * maxLenth
}


class Solution {
	func findLength(_ A: [Int], _ B: [Int]) -> Int {
		let aCount = A.count

		let bCount = B.count




		var sub = [[Int]]()


		for i in 0..<aCount {
			for j in i..<bCount {


				if B.contains(A[j]) {
					sub.append([A[j]])
				}

			}
		}


		return sub[0].count


	}
}













var str = "Hello, playground"
func minPathSumFast(_ grid: [[Int]]) -> Int {
	guard grid.count != 0 && grid[0].count != 0 else {
		return 0
	}

	let m = grid.count, n = grid[0].count
	var dp = Array(repeating: Array(repeating: 0, count: n), count: m)

	for i in 0..<m {
		for j in 0..<n {
			if i == 0 && j == 0 {
				dp[i][j] = grid[i][j]
			} else if i == 0 {
				dp[i][j] = dp[i][j - 1] + grid[i][j]
			} else if j == 0 {
				dp[i][j] = dp[i - 1][j] + grid[i][j]
			} else {
				dp[i][j] = min(dp[i][j - 1], dp[i - 1][j]) + grid[i][j]
			}
		}
	}

	return dp[m - 1][n - 1]

}
func minPathSum(_ grid: [[Int]]) -> Int {
	let m = grid.count, n = grid[0].count
	var newGrid = Array(repeating: Array(repeating: 0, count: n), count: m)



	//enumerated 在cloum这里放着 时间要更多
	//enumerated 的复杂度是 O(1)
	for colun in 0..<m {
		for lie in grid[colun].enumerated() {
			if colun == 0 && lie.offset == 0 {
				newGrid[0][0] = grid[0][0]
			} else {

				if lie.offset == 0 {
					newGrid[colun][lie.offset] = newGrid[colun - 1][0] + grid[colun][lie.offset]
				} else if colun == 0 {
					newGrid[colun][lie.offset] = newGrid[0][lie.offset - 1] + grid[colun][lie.offset]
				} else {
					newGrid[colun][lie.offset] = min(newGrid[colun - 1][lie.offset], newGrid[colun][lie.offset - 1]) + grid[colun][lie.offset]
				}


			}
		}

	}

	return newGrid.last?.last ?? 0


}

//	for colun in grid {
//		let colunNum = grid.firstIndex(of: colun)!.distance(to: 0)
//		for lie in colun {
//			let lieNUm = colun.firstIndex(of: lie)!.distance(to: 0)
//			if colunNum == 0 && lieNUm == 0 {
//				continue
//			} else {
//
//				if lieNUm == 0 {
//					newGrid[colunNum][lieNUm] = newGrid[colunNum - 1][0] + newGrid[colunNum][lieNUm]
//				} else if colunNum == 0 {
//					newGrid[colunNum][lieNUm] = newGrid[0][lieNUm - 1] + newGrid[colunNum][lieNUm]
//				} else {
//					newGrid[colunNum][lieNUm] = min(newGrid[colunNum - 1][lieNUm], newGrid[colunNum][lieNUm - 1]) + grid[colunNum][lieNUm]
//				}
//
//
//			}
//
//
//		}
//	}


minPathSum(
	[[1, 3, 1], [1, 5, 1], [4, 2, 1]])
//
//func permute(_ nums: [Int]) -> [[Int]] {
//
//
//
//
//
//
//	func dg(_ nums: [Int]) -> [Int] {
//
//
//		let first = nums[0]
//
//
//
//		if nums.count <= 1 {
//			return nums
//		}
//		let subArr = nums[1...nums.count]
//		if subArr.count > 1 {
//			return dg(Array.init(subArr))
//		} else {
//
//
//			return Array.init(subArr)
//		}
//
//	}
//
//
//
//}
