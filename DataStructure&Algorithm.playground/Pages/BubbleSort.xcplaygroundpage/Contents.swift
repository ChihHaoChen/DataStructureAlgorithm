public func bubbleSort<Element>(_ array: inout [Element]) where Element: Comparable {
	// 1
	guard array.count >= 2 else {
		return
	}
	// 2 two for loops indicate the time complexity O(n^2)
	for i in 0 ..< array.count { // this bubbles the largest value to the end of the collection
		var swapped = false
		// 3
		for j in 1 ..< (array.count - i) {
			if array[j] < array[j-1] {
				let temp = array[j-1]
				array[j-1] = array[j]
				array[j] = temp
				swapped = true
			}
		}
		// 4
		if !swapped {
			return
		}
	}
}


public func bubbleSortGeneralized<T>(_ collection: inout T) where T: MutableCollection, T.Element: Comparable {
	// 1
	guard collection.count >= 2 else { return }
	// 2
	for end in collection.indices.reversed() {
		var swapped = false
		var current = collection.startIndex
		
		while current < end {
			let next = collection.index(after: current)
			if collection[current] > collection[next] {
				collection.swapAt(current, next)
				swapped = true
			}
			current = next
		}
		// 4
		if !swapped {
			return
		}
	}
}

example(of: "bubble sort") {
	var array = [9, 2, 4, 12, 10, 3]
	
	print("Original: \(array)")
	
	bubbleSort(&array)
	
	print("Bubble sorted: \(array)")
}


example(of: "generalized bubble sort") {
	var array = [9, 2, 4, 12, 10, 3]
	
	print("Original: \(array)")
	
	bubbleSortGeneralized(&array)
	
	print("Generalized Bubble sorted: \(array)")
}
