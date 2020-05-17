import Foundation

public func  quickSortNaive<T: Comparable>(_ a: [T]) -> [T] {
	guard a.count > 1 else { return a }
	// 2
	let pivot = a[a.count/2]
	// 3 calling filter 3 times is not efficient, and new arrays are created everytime
	let less = a.filter { $0 < pivot }
	let equal = a.filter { $0 == pivot }
	let greater = a.filter { $0 > pivot }
	
	return quickSortNaive(less) + equal + quickSortNaive(greater)
}
