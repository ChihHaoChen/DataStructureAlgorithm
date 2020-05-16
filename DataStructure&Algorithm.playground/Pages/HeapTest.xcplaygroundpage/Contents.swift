import Foundation

var heap = Heap(sort: >, elements: [1, 12, 3, 1, 4, 1, 6, 8, 7])


while !heap.isEmpty {
	print(heap.remove()!)
}

print("The top element \(String(describing: heap.peek))")
