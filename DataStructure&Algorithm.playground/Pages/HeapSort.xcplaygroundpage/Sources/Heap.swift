import Foundation

public struct Heap<Element: Equatable> {
	var elements: [Element] = []
	let sort: (Element, Element) -> Bool
	
	// pass an appropriate function in the initializer, we can create both min and max heap
	public init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
		self.sort = sort
		self.elements = elements
		
		if !elements.isEmpty {
			for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
				siftDown(from: i)
			}
		}
	}
	
	public var isEmpty: Bool {
		return elements.isEmpty
	}
	
	var count: Int {
		return elements.count
	}
	
	public func peek() -> Element? {
		return elements.first
	}
	
	
	func leftChildIndex(ofParent index: Int) -> Int {
		return (2 * index) + 1
	}
	
	
	func rightChildIndex(ofParent index: Int) -> Int {
		return (2 * index) + 2
	}
	
	
	func parentIndex(ofChildAt index: Int) -> Int {
		return (index - 1) / 2
	}
	
	// removal is top-down
	public mutating func remove() -> Element? {
		guard !isEmpty else {
			return nil
		}
		// swap the root with the last element in the heap
		elements.swapAt(0, count - 1)
		defer {
			siftDown(from: 0)
		}
		return elements.removeLast()
	}
	
	
	mutating func siftDown(from index: Int) {
		var parent = index

		while true {
			let left = leftChildIndex(ofParent: parent)
			let right = rightChildIndex(ofParent: parent)
			// To store the index to keep track of which index to swap with the parent
			var candidate = parent
			
			if left < count && sort(elements[left], elements[candidate]) {
				candidate = left
			}
			if right < count && sort(elements[right], elements[candidate]) {
				candidate = right
			}
			if candidate == parent { // no more sifting is required
				return
			}
			// swap candidate with parent, and set the candidate as the new parent for next sifting
			elements.swapAt(parent, candidate)
			
			parent  = candidate

		}
	}
	
	
	mutating func siftDownUpTo(from index: Int, upTo end: Int) {
		var parent = index
		
		while true {
			let left = leftChildIndex(ofParent: parent)
			let right = rightChildIndex(ofParent: parent)
			// To store the index to keep track of which index to swap with the parent
			var candidate = parent
			
			if left < end && sort(elements[left], elements[candidate]) {
				candidate = left
			}
			if right < end && sort(elements[right], elements[candidate]) {
				candidate = right
			}
			if candidate == parent { // no more sifting is required
				print("The heap before being swapped: \(elements)")
				return
			}
			// swap candidate with parent, and set the candidate as the new parent for next sifting
			elements.swapAt(parent, candidate)
			
			parent  = candidate
		}
	}
	
	
	// insert is bottom-up
	mutating func insert(_ element: Element) {
		elements.append(element)
		siftUp(from: elements.count - 1)
	}
	
	
	mutating func siftUp(from index: Int) {
		var child = index
		
		var parent = parentIndex(ofChildAt: child)
		
		// to swap the current node with its parent
		while child > 0 && sort(elements[child], elements[parent]) {
			elements.swapAt(child, parent)
			child = parent
			parent = parentIndex(ofChildAt: child)
		}
	}
	
	
	// removal of any element
	public mutating func remove(at index: Int) -> Element? {
		guard index < elements.count else {
			return nil
		}
		
		if index == elements.count - 1 {
			return elements.removeLast()
		} else {
			// if the element is not the last one, first swap this element with the last one
			elements.swapAt(index, elements.count - 1)
			defer {
				siftDown(from: index)
				siftUp(from: index)
			}
		}
		return elements.removeLast()
	}
	
	
	func index(of element: Element, startingAt i: Int) -> Int? {
		if i >= elements.count {
			return nil
		}
		// if the element has higher priority than the current element at index i, then this element should be higher in the heap
		if sort(element, elements[i]) {
			return nil
		}
		if element == elements[i] {
			return i
		}
		if let j = index(of: element, startingAt: leftChildIndex(ofParent: i)) {
			return j
		}
		if let j = index(of: element, startingAt: rightChildIndex(ofParent: i)) {
			return j
		}
		return nil
	}
}


extension Heap {
	public func sorted() -> [Element] {
		var heap = Heap(sort: sort, elements: elements) // 1
		for index in heap.elements.indices.reversed() {
			heap.elements.swapAt(0, index)
			heap.siftDownUpTo(from: 0, upTo: index)
		}
		return heap.elements
	}
}
