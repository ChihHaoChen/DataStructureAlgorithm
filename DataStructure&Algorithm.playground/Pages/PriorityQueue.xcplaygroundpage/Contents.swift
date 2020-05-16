
import Foundation

struct  PriorityQueue<Element: Equatable>: Queue {
	// 1
	private var heap: Heap<Element> // 2
	
	init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
		heap = Heap(sort: sort, elements: elements)
	}
	
	
	var isEmpty: Bool {
		return heap.isEmpty
	}
	
	
	var peek: Element? {
		return heap.peek()
	}
	
	
	mutating func enqueue(into element: Element) -> Bool {
		heap.insert(element)
		
		return true
	}
	
	
	mutating func dequeue() -> Element? {
		return heap.remove()
	}
}


var priorityQueue = PriorityQueue(sort: <, elements: [1, 12, 3, 1, 4, 1, 6, 8, 7])

while !priorityQueue.isEmpty {
	print(priorityQueue.dequeue()!)
}
