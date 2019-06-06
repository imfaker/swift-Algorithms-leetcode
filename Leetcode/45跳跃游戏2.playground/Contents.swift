import UIKit

var str = "Hello, playground"


var nums = [0]

for i in 0...100 {
	nums.append(1)
}


func jumpp(nums: [Int]) -> Int {


	if nums.count == 1 {
		return 0
	}

	var reach = 0
	var nextreach = 0
	var step = 0

	for i in  0...(nums.count - 1){
		nextreach = max(i + nums[i], nextreach)
				if nextreach >= nums.count - 1 {
					return step + 1
				}
				if i == reach {
					step = step + 1
					reach = nextreach
				}
	}
//	for value in nums.enumerated() {
//		nextreach = max(value.offset + nums[value.offset], nextreach)
//		if nextreach >= nums.count - 1 {
//			return step + 1
//		}
//		if value.offset == reach {
//			step = step + 1
//			reach = nextreach
//		}
//	}
	return  step
}


//[6,2,6,1,7,9,3,5,3,7,2,8,9,4,7,7,2,2,8,4,6,6,1,3] = 4
//[6,9,1,5,6,0,0,5,9]
//[7,0,9,6,9,6,1,7,9,0,1,2,9,0,3]
func jump(nums: [Int]) -> Int {

	let maxIndex = nums.count - 1
	var step = 0
	var previcusIndex = 0
	var nextIndex = nums[previcusIndex] + previcusIndex
	if previcusIndex >= maxIndex {
		return step
	}
	if nextIndex >= maxIndex {
		return step + 1
	}
	var maxNextIndex = nums[nextIndex] + nextIndex
	var tmpNextIndex = nextIndex

	for value in nums.enumerated() {
		if previcusIndex >= maxIndex {
			return step
		}
		if nextIndex >= maxIndex {
			return step + 1
		}

		if maxNextIndex >= maxIndex {
			return step + 2
		}

		if value.offset >= nextIndex {
			step = step + 1
			if tmpNextIndex == previcusIndex {
				tmpNextIndex = nextIndex
			}
			previcusIndex = tmpNextIndex
			nextIndex = nums[previcusIndex] + previcusIndex

			if nextIndex >= maxIndex {
				return step + 1
			}
			maxNextIndex = nums[nextIndex] + nextIndex
			continue
		}

		if value.offset + value.element > maxNextIndex {
			tmpNextIndex = value.offset
			maxNextIndex = nums[tmpNextIndex] + tmpNextIndex
		}


	}


	return step

	//judgeNextRangeMaxIndex(previusIndex: 0)



}

//
//
jump(nums: [2, 3, 1, 1, 4])
jump(nums: nums)

jump(nums: [0])
jump(nums: [2, 1])
jump(nums: [1, 1, 1])


jump(nums: [1, 0, 1])
jump(nums: [1, 1, 1])
jump(nums: [1, 1, 1, 1])
jump(nums: [6, 9, 1, 5, 6, 0, 0, 5, 9])
jump(nums: [5, 4, 0, 1, 3, 6, 8, 0, 9, 4, 9, 1, 8, 7, 4, 8])

jump(nums: [6, 2, 6, 1, 7, 9, 3, 5, 3, 7, 2, 8, 9, 4, 7, 7, 2, 2, 8, 4, 6, 6, 1, 3]) == 4









func judgeNextRangeMaxIndex(previusIndex: Int) -> Int {
	if previusIndex >= (nums.count - 1) {
		return previusIndex
	}
	// step = step + 1
	if nums[previusIndex] + previusIndex >= (nums.count - 1) {
		return previusIndex
	}
	let previusCanMoveMAxIndex = nums[previusIndex]
	let nextIndex = previusIndex + previusCanMoveMAxIndex
	let nextCanMoveMAxIndex = nums[nextIndex]

	var finalMaxIndex = nextIndex + nextCanMoveMAxIndex
	var returnNextPreviuseMaxIndex = nextIndex

	for canMoveIndex in nums.enumerated() {
		if canMoveIndex.offset == 0 {
			continue
		}
		if canMoveIndex.element + canMoveIndex.offset > finalMaxIndex {
			finalMaxIndex = canMoveIndex.element + canMoveIndex.offset

			returnNextPreviuseMaxIndex = canMoveIndex.offset
		}

		if canMoveIndex.offset >= nextIndex {
			break
		}
	}


	return judgeNextRangeMaxIndex(previusIndex: returnNextPreviuseMaxIndex)

}
