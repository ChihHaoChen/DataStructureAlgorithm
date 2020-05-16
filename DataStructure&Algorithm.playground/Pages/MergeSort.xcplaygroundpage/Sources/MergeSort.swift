import Foundation

public func mergeSort<Element>(_ array: [Element]) -> [Element] where Element: Comparable {
	// 1
	guard array.count > 1 else { return array }
	let middle = array.count/2
	// 2 call mergeSort on left and right halves -> O(log(N))
	let left = mergeSort(Array(array[..<middle]))
	let right = mergeSort(Array(array[middle...]))
	// 3 to combined the sort sub-arrays -> O(N)
	return merge(left, right)
}


private func merge<Element>(_ left: [Element], _ right: [Element]) -> [Element] where Element: Comparable {
	// 1 to track the progress
	var leftIndex = 0
	var rightIndex = 0
	// 2 to store the combined array
	var result: [Element] = []
	// 3
	while leftIndex < left.count && rightIndex < right.count {
		let leftElement = left[leftIndex]
		let rightElement = right[rightIndex]
		print("step 3 - left: \(left) and right: \(right)")
		// 4
		if leftElement < rightElement {
			result.append(leftElement)
			print("step 4_1 result: \(result)")
			leftIndex += 1
		} else if leftElement > rightElement {
			result.append(rightElement)
			print("step 4_2 result: \(result)")
			rightIndex += 1
		} else {
			result.append(leftElement)
			result.append(rightElement)
			print("step 4_3 result: \(result)")
			leftIndex += 1
			rightIndex += 1
		}
	}
	// 5
	if leftIndex < left.count {
		result.append(contentsOf: left[leftIndex...])
		print("step 5_1 result: \(result)")
	}
	if rightIndex < right.count {
		result.append(contentsOf: right[rightIndex...])
		print("step 5_2 result: \(result)")
	}
	return result
}
