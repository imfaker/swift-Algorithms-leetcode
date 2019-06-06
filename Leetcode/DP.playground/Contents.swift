import UIKit

import PlaygroundSupport
///1000. 合并石头的最低成本
class Solution {
	func mergeStones(_ stones: [Int], _ K: Int) -> Int {

		guard stones.count == 0,
			stones.count % (K - 1) == K else {
				return -1
		}
		return 0

	}
}

var str = "Hello, playground"

func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {

	let dayTicket = costs[0]
	let weekTicket = costs[1]
	let monthTicket = costs[2]

	var cost_min = Array.init(repeating: 0, count: 365)

	for i in 1...365 {

		if days.contains(i) {

			let dayAgo = ((i - 1) >= 1) ? (i - 1) : 1
			let weekAgo = ((i - 7) >= 1) ? (i - 7) : 1
			let monthAge = ((i - 30) >= 1) ? (i - 30) : 1


			let addDayAgoCost = cost_min[dayAgo - 1] + dayTicket
			let addWeekAgoCost = cost_min[weekAgo - 1] + weekTicket
			let addMonthAgoCost = cost_min[monthAge - 1] + monthTicket



			let minCost = min(addDayAgoCost, addWeekAgoCost, addMonthAgoCost)

			//	print(minCost)
			cost_min[i - 1] = minCost
		} else {

			if i > 1 {
				cost_min[i - 1] = cost_min[i - 2]
			}



		}
	}


	return cost_min[364]
}



mincostTickets([1, 4, 6, 7, 8, 20], [2, 7, 15])



//1029




func twoCitySchedCost(_ costs: [[Int]]) -> Int {

	typealias indexAndGapTuple = (index: Int, gap: Int)
	var APlaceNum = 0
	var bPlaceNum = 0
	return costs.enumerated().map { (cost) -> indexAndGapTuple in
		return (cost.offset, abs(cost.element[0] - cost.element[1]))
	}.sorted { (last, next) -> Bool in
		return last.gap > next.gap
	}.reduce(0) { (result, nextGap) -> Int in

		if APlaceNum < costs.count / 2 {
			if costs[nextGap.index][0] < costs[nextGap.index][1] {
				APlaceNum = APlaceNum + 1
				return result + costs[nextGap.index][0]
			} else {
				if bPlaceNum < costs.count / 2 {
					bPlaceNum = bPlaceNum + 1
					return result + costs[nextGap.index][1]
				} else {
					APlaceNum = APlaceNum + 1
					return result + costs[nextGap.index][0]
				}
			}
		} else {
			return result + costs[nextGap.index][1]
		}
	}


}

func anotherTwoCitySchedCost(_ costs: [[Int]]) -> Int {

	typealias indexAndGapTuple = (index: Int, gap: Int)
	var APlaceNum = 0
	return costs.enumerated().map { (cost) -> indexAndGapTuple in
		return (cost.offset, cost.element[0] - cost.element[1])
	}.sorted { (last, next) -> Bool in
		return last.gap > next.gap
	}.reduce(0) { (result, nextGap) -> Int in

		if APlaceNum < costs.count / 2 {
			APlaceNum = APlaceNum + 1
			return result + costs[nextGap.index][1]
		} else {
			return result + costs[nextGap.index][0]
		}
	}





}

//1029
twoCitySchedCost([[259, 770], [448, 54], [926, 667], [184, 139], [840, 118], [577, 469]])



print(Int.max)
///  dp 中用 Int 可能会值溢出
func combinationSum4(_ nums: [Int], _ target: Int) -> Int {

	var dp = [Double](repeatElement(0, count: target + 1))

	dp[0] = 1


	for i in 1...target {
		for num in nums {
			if i >= num {
				dp[i] = dp[i] + dp[i - num]

			}
		}
	}


	return Int.init(exactly: dp[target])!
}

combinationSum4([3, 33, 333], 10000)


/// better 377 Combination Sum IV combinationSum4时间复杂度好很多，用的递归  为 O(nlgn) 而bootomUp 则是循环O(n*m)，但是 递归所用的空间更多 ，复杂度更高 。 而循环空间更少
class combinationSum4Solution {

	var i = 0

///递归的时间复杂度好很多   自顶向下
	func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
		var dp = [Int](repeatElement(-1, count: target + 1))
		dp[0] = 1
		return helper(nums, target, &dp)
	}

	func helper(_ nums: [Int], _ target: Int, _ dp: inout [Int]) -> Int {
		i += 1
		if dp[target] != -1 {
			return dp[target]
		}



		var result = 0

		for i in 0..<nums.count {
			if target >= nums[i] {
				result += helper(nums, target - nums[i], &dp)
			}
		}
		dp[target] = result

		return result
	}

	func combinationSum4_BottomUp(_ nums: [Int], _ target: Int) -> Int {
		var dp = [Double](repeatElement(0, count: target + 1))

		dp[0] = 1
		for i in 1..<dp.count {
			for j in 0..<nums.count {
				if i - nums[j] >= 0 {
					dp[i] += dp[i - nums[j]]
				}
			}
		}

		return Int(dp[target])
	}
}

combinationSum4Solution().combinationSum4([3, 33, 333], 10000)

combinationSum4Solution().combinationSum4_BottomUp([3, 33, 333], 10000)
func ss(dd ll: String) {

}

func ss(dd ldddl: Int) {

}


class deleteAndEarnSolution {
	func deleteAndEarn(_ nums: [Int]) -> Int {

		var dp = [Int](repeating: 0, count: 10001)

		for i in 0..<nums.count {
			dp[i] += 1
		}
		for j in 2..<10001 {
			dp[j] = max(dp[j - 2] + dp[j] * j, dp[j - 1])
		}

		return dp[10000]
	}
}
