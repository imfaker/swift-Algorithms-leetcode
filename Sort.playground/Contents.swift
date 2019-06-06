import UIKit

var str = "Hello, playground"
//
//稳定的排序算法：冒泡排序、插入排序、归并排序和基数排序。
//
//不是稳定的排序算法：选择排序、快速排序、希尔排序、堆排序。


var num = [4, 5, 99, 3, 6, 0, -3, 6]

//步骤如下：
//	* 比较相邻的元素。如果第一个比第二个大，就交换他们两个，直到把最大的元素放到数组尾部。
//	* 遍历长度减一，对剩下的元素从头重复以上的步骤。
//	* 直到没有任何一对数字需要比较时完成。
// good O(n)  bad O(n*n)
func bubblingSort(_ nums: [Int], where precediate: (Int, Int) throws -> Bool) rethrows -> [Int] {
	var num = nums
	for i in (0..<num.count).reversed() {
		for j in 0..<i {
			if try precediate(num[i], num[j]) {
				num.swapAt(i, j)
			}
		}
	}
	print(num)
	return num

}

bubblingSort(num) { (left, right) -> Bool in
	return true
}


//步骤如下：
//	* 遍历数组，找到最小的元素，将其置于数组起始位置。
//	* 从上次最小元素存放的后一个元素开始遍历至数组尾，将最小的元素置于开始处。
//	* 重复上述过程，直到元素排序完毕。

// good O(n)  bad O(n*n)  空间O(1)
func selectionSort(_ nums: [Int]) -> [Int] {

	var num = nums

	for i in 0..<num.count {
		var tmp = i
		for j in i..<num.count {
			if num[tmp] > num[j] {
				tmp = j
			}

		}
		if i < num.count {
			num.swapAt(tmp, i)
		}

	}

	print(num)
	return num
}

selectionSort(num)


//
//步骤如下：
//	* 从第一个元素开始，该元素可以认为已经被排序
//	* 取出下一个元素，在已经排序的元素序列中从后向前扫描
//	* 如果该元素（已排序）大于新元素，将该元素移到下一位置
//	* 重复步骤3，直到找到已排序的元素小于或者等于新元素的位置
//	* 将新元素插入到该位置后
//	* 重复步骤2~5
//最好的情况下，完全没有任何数据移动，时间复杂度是O(n)。最坏的情况下，比较的次数为 (n+2) * (n-1)/2，移动的次数最大值为(n+4) * (n-1)/2。如果按照序列的好坏程度是随机的，且概率都是相同的，则平均比较次数以及平均移动次数都约为 n^2/4次，所以时间复杂度为O(n ^ 2)。通过和冒泡以及简单选择排序对比，不难看出直接插入排序的性能稍微比前两者好上一些。

//插值排序对于小数据量的排序来说非常快。在一些标准程序库里，如果数据大小不大于10，它们会用插值排序来取代快速排序。
// bad  average O(n*n)
func insertionSort(_ nums: [Int]) -> [Int] {
	var num = nums
	for i in 1..<num.count {
		for j in (0...(i - 1)).reversed() {
			if num[j + 1] < num[j] {
				num.swapAt(j + 1, j)
			}

		}

	}
	print(num)
	return num

}

insertionSort(num)
//var num = [4, 5, 99, 3, 6, 0, -3, 6]


//步骤：
//	* 从数列中挑出一个元素，称为 “基准”（pivot），
//		* 重新排序数列，所有元素比基准值小的摆放在基准前面，所有元素比基准值大的摆在基准的后面（相同的数可以到任一边）。在这个分区退出之后，该基准就处于数列的中间位置。这个称为分区（partition）操作。
//		* 递归地（recursive）把小于基准值元素的子数列和大于基准值元素的子数列排序。
//本质上来看，快速排序应该算是在冒泡排序基础上的递归分治法。
// 升序 func quickSort(list: inout [Int], left: Int, right: Int) {
//快排的时间复杂度为时间复杂度 O(n log n)。最差情况，递归调用 n 次，即空间复杂度为 O(n)。最好情况，递归调用 log n 次，空间复杂度为 O(log n)，空间复杂度一般看最差情况，时间可以平均，但空间一定得满足，所以空间复杂度为 O(n)。

// 不稳定排序
func quickSort(list: inout [Int], left: Int, right: Int) {


	if left >= right {
		return
	}

	let pivot = list[left]

	var i = left

	var j = right

	while i != j {

		// 这里 比较符号  决定了是升序还是 降序  ，这里现在是 升序
		while list[j] >= pivot && i < j { //右边大的往左移动
			j -= 1
		}

		while list[i] <= pivot && i < j { //左边小的往右移动
			i += 1
		}

		if i < j { //找到两个对方区域的值进行交换
			let temp = list[i]
			list[i] = list[j]
			list[j] = temp
		}
	}
/// 准确的说 是 i和j 相互往中间移动 ，到相遇之时，就是 i和j 相等, 比i j小的就比 privot小 ，反之亦然。
// 	list[left] = list[i]  因为 是 先判断高的 所以 是 高的先到终点， 所以 这个j的值只可能比那个 pivot小，所以
	//  将pvit的 值放到中间， 所以 将 left的值和 i 的值进行替换 , 因为 left的值就是 pivot
	list[left] = list[i]//此时i和j相等，处于中间位置，替换pivot值
	list[i] = pivot

	//重复以上动作
	quickSort(list: &list, left: left, right: i - 1)
	quickSort(list: &list, left: i + 1, right: right)

}

print(quickSort(list: &num, left: 0, right: num.count - 1))

//https://upload-images.jianshu.io/upload_images/1940317-6edb0a2e86d357aa?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240
/// 升序
func quickSort(list: inout [Int]) {
	func sort(list: inout [Int], low: Int, high: Int) {
		if low < high {
			let pivot = list[low]
			var l = low; var h = high
			while l < h {
				while list[h] >= pivot && l < h { h -= 1 }
				list[l] = list[h]
				while list[l] <= pivot && l < h { l += 1 }
				list[h] = list[l]
			}
			list[h] = pivot
			sort(list: &list, low: low, high: l - 1)
			sort(list: &list, low: l + 1, high: high)
		}
	}
	sort(list: &list, low: 0, high: list.count - 1)
}

quickSort(list: &num)



//
//// 空间原址性 只需要 常数个 额外元素空间存储


//在构建堆的过程中，由于是是完全二叉树从最下层最右边非终端节点开始构建，将它与子节点进行比较，对于每个非终端节点而言，最多进行两次比较和交换操作，因此构建堆的时间复杂度为O(n)。在整个排序过程中，第 i 次去堆顶记录重建堆需要时间为logi ,并且需要取 n - 1次堆记录，所以重建对的时间复杂度为O(nlogn)。所以对的时间复杂度为O(nlogn)。
//空间上只需一个暂存单元。由于记录的比较是跳跃进行的，所以堆排序是一种不稳定的排序。最后要提醒一点，由于初始构建堆的所需的比较次数比较多。所以，一般不适合排序个数较少的数组。


Heap.sorted(num)


@discardableResult func binSearch(list: [Int], find: Int) -> Int {
	var low = 0, high = list.count - 1
	while low <= high {
		let mid = (low + high) / 2
		if find == list[mid] { return mid }
			else if (find > list[mid]) { low = mid + 1 }
			else { high = mid - 1 }
	}
	return -1
}




@discardableResult func recursiveBinSearch(list: [Int], find: Int) -> Int {
	func search(list: [Int], low: Int, high: Int, find: Int) -> Int {
		if low <= high {
			let mid = (low + high) / 2
			if find == list[mid] { return mid }
				else if (find > list[mid]) {
					return search(list: list, low: mid + 1, high: high, find: find)
			}
				else {
					return search(list: list, low: low, high: mid - 1, find: find)
			}
		}
		return -1
	}
	return search(list: list, low: 0, high: list.count - 1, find: find)
}


func merge(array: inout [Int], heplerArray: inout [Int], left: Int, right: Int, middle: Int) {


	////  先将 所有的
	// copy both halves into a helper array
	for i in left...right {
		heplerArray[i] = array[i]
	}

	var helperLeft = left
	var helperRight = middle + 1
	var current = left

	// iterate through helper array and copy the right one to original array
	while helperLeft <= middle && helperRight <= right {
		if heplerArray[helperLeft] <= heplerArray[helperRight] {
			array[current] = heplerArray[helperLeft]
			helperLeft += 1
		} else {
			array[current] = heplerArray[helperRight]
			helperRight += 1
		}
		current += 1
	}

	// handle the rest
	guard middle - helperLeft >= 0 else {
		return
	}
	for i in 0 ... middle - helperLeft {
		array[current + i] = heplerArray[helperLeft + i]
	}


}
func merge_sort(array: inout [Int], heplerArray: inout [Int], left: Int, right: Int) {

	guard left < right else {
		return
	}


	let middle = (right - left) / 2

	merge_sort(array: &array, heplerArray: &heplerArray, left: left, right: middle)
	merge_sort(array: &array, heplerArray: &heplerArray, left: middle + 1, right: right)

	merge(array: &array, heplerArray: &heplerArray, left: left, right: right, middle: middle)
}

//  空间父子度 O(N) 时间O(nlogn)
func mergeSort(_ nums: [Int]) -> [Int] {

	var array = nums

	let count = nums.count
	var helperArray = Array.init(repeating: 0, count: count - 1)





	merge_sort(array: &array, heplerArray: &helperArray, left: 0, right: count)




	print(array)
	return array
}


mergeSort([3, 3, 6, 3, 9965, 6, 9, 13, 66])

//
//func mergeSort(array: [Int]) -> [Int] {
//	var helper = Array.init(repeating: 0, count: array.count)
//	var array = array
//	mergeSort(array: &array, &helper, 0, array.count - 1)
//	return array
//}
//
//func mergeSort( array:inout [Int],  _ helper:inout [Int], _ low: Int, _ high: Int) {
//	guard low < high else {
//		return
//	}
//
//	let middle = (high - low) / 2 + low
//	mergeSort(array: &array, &helper, low, middle)
//	mergeSort(array: &array, &helper, middle + 1, high)
//	merge(array: &array, &helper, low, middle, high)
//}
//
//func merge( array:inout [Int],  _ helper:inout [Int], _ low: Int, _ middle: Int, _ high: Int) {
//	// copy both halves into a helper array
//	for i in low ... high {
//		helper[i] = array[i]
//	}
//
//	var helperLeft = low
//	var helperRight = middle + 1
//	var current = low
//
//	// iterate through helper array and copy the right one to original array
//	while helperLeft <= middle && helperRight <= high {
//		if helper[helperLeft] <= helper[helperRight] {
//			array[current] = helper[helperLeft]
//			helperLeft += 1
//		} else {
//			array[current] = helper[helperRight]
//			helperRight += 1
//		}
//		current += 1
//	}
//
//	// handle the rest
//	guard middle - helperLeft >= 0 else {
//		return
//	}
//	for i in 0 ... middle - helperLeft {
//		array[current + i] = helper[helperLeft + i]
//	}
//}

//mergeSort(array: [4,2,1,8,9,99,556,0,-4])
//
//希尔排序
//原理解析
//
//引自维基百科希尔排序，也称递减增量排序算法，是插入排序的一种更高效的改进版本。希尔排序是非稳定排序算法。
//
//希尔排序是基于插入排序的以下两点性质而提出改进方法的：
//
//插入排序在对几乎已经排好序的数据操作时，效率高，即可以达到线性排序的效率
//但插入排序一般来说是低效的，因为插入排序每次只能将数据移动一位
//
//与插入排序通过对比相邻的两个元素的大小并在必要时候交换位置，希尔排序是通过比较相隔很远的两个元素。
//两个元素之间的距离称为间隔。如果两个元素在比较之后需要交换位置，则直接更换彼此的位置。这个过程减少了插值排序中很多不必要的中间复制过程，即从两个元素更换位置前需要不断交换相邻元素的位置直到目的位置。
//这里的最主要的思想就是，元素通过每次移动较大间隔，整个数组可以快速形成局部排序好的情况。这个会让接下来的交换变得更加快速。因为元素之间不需要进行过多次的位置交换。
//一旦某一距离长度的间隔比值交换完成，间隔会变得越来越小，然后进行相应间隔的比值交换，这样的过程不断重复，直到间隔为1，也就是与插值排序同样过程的情况。然而，在希尔排序中，由于大部分数据在此时已经整理完毕，所以最后间隔为1的比值交换速度非常快。
//解题步骤
//步骤如下：
//	* 希尔排序是把记录按下标的一定增量分组，对每组使用直接插入排序算法排序；
//	* 随着增量逐渐减少，每组包含的关键词越来越多，当增量减至1时，整个文件恰被分成一组，算法便终止。
//
//以n=10的一个数组49, 38, 65, 97, 26, 13, 27, 49, 55, 4为例
//第一次增量 gap = 10 / 2 = 5
//49   38   65   97   26   13   27   49   55   4
//
//1A                       1B
//
//2A                       2B
//
//3A                       3B
//
//4A                       4B
//
//5A                       5B
//
//1A,1B，2A,2B等为分组标记，数字相同的表示在同一组，大写字母表示是该组的第几个元素， 每次对同一组的数据进行直接插入排序。即分成了五组(49, 13) (38, 27) (65, 49)  (97, 55)  (26, 4)这样每组排序后就变成了(13, 49)  (27, 38)  (49, 65)  (55, 97)  (4, 26)，下同。
//第二次增量 gap = 5 / 2 = 2
//13   27   49   55   4    49   38   65   97   26
//
//1A        1B        1C        1D        1E
//
//2A        2B        2C        2D        2E
//
//第三次增量 gap = 2 / 2 = 1
//4   26   13   27   38    49   49   55   97   65
//
//1A  1B   1C   1D   1E    1F   1G   1H   1I   1J
//
//第四次增量 gap = 1 / 2 = 0 排序完成得到数组：
//4   13   26   27   38    49   49   55   65   97
//
//实现代码
//func shellSort(arr: inout [Int]) {//希尔排序
//	var j: Int
//	var gap = arr.count / 2//获取增量
//
//	while  gap > 0 {
//		for i in 0 ..< gap {
//			j = i + gap
//			while j < arr.count {
//				if arr[j] < arr[j - gap] {
//					let temp = arr[j]
//					var k = j - gap
//					while (k >= 0 && arr[k] > temp) {//插入排序
//						arr[k + gap] = arr[k]
//						k -= gap
//					}
//					arr[k + gap] = temp
//				}
//
//				j += gap
//			}
//
//		}
//		gap /= 2//增量减半
//	}
//}
//
//
//希尔排序时间复杂度
//希尔排序的时间复杂度与增量(即，步长gap)的选取有关。例如，当增量为1时，希尔排序退化成了直接插入排序，此时的时间复杂度为O(N²)，而Hibbard增量的希尔排序的时间复杂度为O(N3/2)。
//希尔排序稳定性
//希尔排序是不稳定的算法，它满足稳定算法的定义。对于相同的两个数，可能由于分在不同的组中而导致它们的顺序发生变化。
//算法稳定性 -- 假设在数列中存在a[i]=a[j]，若在排序之前，a[i]在a[j]前面；并且排序之后，a[i]仍然在a[j]前面。则这个排序算法是稳定的！

//作者：jackyshan
//链接：https://www.jianshu.com/p/2496f7be35d3
//来源：简书
//简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。

//排序取舍
//我们将上述所有的排序算法和系统的排序进行了比较, 以10000个随机数为例.
//
//scope(of: "sort", execute: true) {
//	scope(of: "systemsort", execute: true, action: {
//	let list = randomList(10000)
//	timing {_ = list.sorted()}
//	//  print(list.sorted())
//	})
//
//	scope(of: "systemsort2", execute: true, action: {
//	let list = randomList(10000)
//	timing {_ = list.sorted {$0 < $1}}
//	//  print(list.sorted {$0 < $1})
//	})
//
//	scope(of: "selectsort", execute: true, action: {
//	var list = randomList(10000)
//	timing {selectSort(list: &list)}
//	//  print(list)
//	})
//
//	scope(of: "opt_selectsort", execute: true, action: {
//	var list = randomList(10000)
//	timing {optimizationSelectSort(list: &list)}
//	//  print(list)
//	})
//
//	scope(of: "popsort", execute: true, action: {
//	var list = randomList(10000)
//	timing {popSort(list: &list)}
//	//  print(list)
//	})
//
//	scope(of: "opt_popsort", execute: true, action: {
//	var list = randomList(10000)
//	timing {optimizationPopSort(list: &list)}
//	//  print(list)
//	})
//
//	scope(of: "quicksort", execute: true, action: {
//	var list = randomList(10000)
//	timing {quickSort(list: &list)}
//	//  print(list)
//	})
//	}
//	--- scope of: sort ---
//--- scope of: systemsort ---
//timing: 0.010432243347168
//--- scope of: systemsort2 ---
//timing: 0.00398015975952148
//--- scope of: selectsort ---
//timing: 2.67806816101074
//--- scope of: opt_selectsort ---
//timing: 0.431572914123535
//--- scope of: popsort ---
//timing: 3.39597702026367
//--- scope of: opt_popsort ---
//timing: 3.59421491622925
//--- scope of: quicksort ---
//timing: 0.00454998016357422
//我们可以看到, 其中我写的快排是效率最高的, 和系统的排序是一个数量级的, 而选择比冒泡的效率要高, 而令人疑惑的是同样是系统的排序加上{$0 < $1}比较规则, 效率会有数量级的提升.
//现在大家知道如何选择排序算法了么?
