import Foundation

public func partitionHoare<T: Comparable>(_ a: inout[T], low: Int, high: Int) -> Int {
	
	// 1
	let pivot = a[low]
	// 2 every index before i will be less than or equal to the pivot, and vice versa.
	var i = low - 1
	var j = high + 1
	
	while true {
		// decrease j until it reaches an element that is not greater than the pivot
		repeat { j -= 1 } while a[j] > pivot
		// increase i until it reaches an element that is not lesser than the pivot
		repeat { i += 1 } while a[i] < pivot
		// if i and j haven't got overlapped, swap the elements, otherwise, just return the index that separates both regions
		if i < j {
			a.swapAt(i, j)
		} else {
			return j
		}
	}
}


public func quickSortHoare<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
	if low < high {
		let p = partitionHoare(&a, low: low, high: high)
		quickSortHoare(&a, low: low, high: p)
		quickSortHoare(&a, low: p + 1, high: high)
	}
}
