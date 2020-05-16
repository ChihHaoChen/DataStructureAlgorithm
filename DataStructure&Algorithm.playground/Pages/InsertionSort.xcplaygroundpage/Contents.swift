import Foundation

public func insertionSort<Element>(_ array: inout [Element]) where Element: Comparable {
	guard array.count >= 2 else { return }
	
	// 1
	for current in 1 ..< array.count {
		// 2 to run backwards from the current index so we can shift left as needed
		for shifting in (1...current).reversed() {
			// 3 to keep shifting the element left. As soon as the element is in position, break the inner loop and start with the next element
			if array[shifting] < array[shifting - 1] {
				array.swapAt(shifting, shifting - 1)
			} else {
				break
			}
		}
	}
}


public func insertionSortGeneralized<T>(_ collection: inout T) where T: BidirectionalCollection & MutableCollection, T.Element: Comparable {
	guard collection.count >= 2 else { return }
	
	for current in collection.indices {
		var shifting =  current
		while shifting > collection.startIndex {
			let previous =  collection.index(before: shifting)
			if collection[shifting] < collection[previous] {
				collection.swapAt(shifting, previous)
			} else {
				break
			}
			shifting = previous
		}
	}
}

example(of: "insertion sort") {
	var array = [9, 2, 4, 12, 10, 3]
	
	print("Original: \(array)")
	
	insertionSort(&array)
	
	print("Bubble sorted: \(array)")
}



example(of: "generalized insertion sort") {
	var array = [9, 2, 4, 12, 10, 3]
	
	print("Original: \(array)")
	
	insertionSortGeneralized(&array)
	
	print("Generalized Bubble sorted: \(array)")
}

