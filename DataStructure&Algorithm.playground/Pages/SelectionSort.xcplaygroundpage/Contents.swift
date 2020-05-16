import Foundation

public func selectionSort<Element>(_ array: inout [Element]) where Element: Comparable {
	guard array.count >= 2 else { return }
	// 1
	for current in 0..<(array.count - 1) {
		var lowest = current
		// 2 to go through the remainder of the collection to find the element with the lowest value
		for other in (current + 1) ..< array.count {
			if array[lowest] > array[other] {
				lowest = other
			}
		}
		// 3 if that element not the current one, swap them
		if lowest != current {
			array.swapAt(lowest, current)
		}
	}
}


public func selectionSortGeneralized<T>(_ collection: inout T) where T: MutableCollection, T.Element: Comparable {
	guard collection.count >= 2 else { return }
	
	for current in collection.indices {
		var lowest = current
		var other = collection.index(after: current)
		
		while other < collection.endIndex {
			if collection[lowest] > collection[other] {
				lowest = other
			}
			other = collection.index(after: other)
		}
		
		if lowest != current {
			collection.swapAt(lowest, current)
		}
		
	}
}

 example(of: "selection sort") {
	 var array = [9, 2, 4, 12, 10, 3]
	 
	 print("Original: \(array)")
	 
	 selectionSort(&array)
	 
	 print("Bubble sorted: \(array)")
 }


example(of: "generalized selection sort") {
	var array = [9, 2, 4, 12, 10, 3]
	
	print("Original: \(array)")
	
	selectionSortGeneralized(&array)
	
	print("Generalized Bubble sorted: \(array)")
}


