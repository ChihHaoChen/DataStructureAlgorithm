import Foundation
import PlaygroundSupport


example(of: "creating and linking nodes") {
	let node1 = Node(value: 1)
	let node2 = Node(value: 2)
	let node3 = Node(value: 3)
	
	node1.next = node2
	node2.next = node3
	
	print(node1)
}


example(of: "Push") {
	var list = LinkedList<Int>()
	
	list.push(next: 3)
	list.push(next: 2)
	list.push(next: 1)
	
	print(list)
}


example(of: "Append") {
	var list = LinkedList<Int>()
	
	list.append(next: 1)
	list.append(next: 2)
	list.append(next: 3)
	
	print(list)
}


example(of: "inserting at a particular index") {
	var list = LinkedList<Int>()
	
	list.push(next: 3)
	list.push(next: 2)
	list.push(next: 1)
	
	print("Before inserting: \(list)")
	
	var middleNode = list.node(at: 0)!
	
	for _ in 1...5 {
		middleNode = list.insert(-2, after: middleNode)
	}
	
	print("After inserting: \(list)")
}

example(of: "pop") {
	var list = LinkedList<Int>()
	
	list.push(next: 3)
	list.push(next: 2)
	list.push(next: 1)
	
	print("Before popping list: \(list)")
	
	let poppedValue = list.pop()
	
	print("After popping list: \(list)")
	
	print("Popped values: " + String(describing: poppedValue))
}


example(of: "Removing the last node") {
	var list = LinkedList<Int>()
	list.push(next: 3)
	list.push(next: 2)
	list.push(next: 1)
	list.push(next: 4)
	
	print("Before removing the last node: \(list)")
	let removedValue = list.removeLast()
	print("After removing the last node: \(list)")
	print("The removed and last node: " + String(describing: removedValue))
	
	print("Before 2nd removing the last node: \(list)")
	let removedValue2 = list.removeLast()
	print("After 2nd removing the last node: \(list)")
	print("The removed and last node: " + String(describing: removedValue2))
}


example(of: "removing a node after a particular node") {
	var list = LinkedList<Int>()
	
	list.push(next: 4)
	list.push(next: 3)
	list.push(next: 2)
	list.push(next: 1)
	
	print("Before removing at particular index: \(list)")
	let index = 2
	let node = list.node(at: index-1)!
	let removedValue = list.remove(after: node)
	
	print("After removing at index \(index): \(list)")
	print("Removed values: " + String(describing: removedValue))
}


example(of: "Using collection") {
	var list = LinkedList<Int>()
	
	for i in 0...9 {
		list.append(next: i)
	}
	
	print("The origianl list: \(list)")
	
	print("First element: \(list[list.startIndex])")
	
	print("Array containing first 3 elements: \(Array(list.prefix(3)))")
	
	print("Array containing last 3 elements: \(Array(list.suffix(3)))")
	
	let sum = list.reduce(0, +)
	print("Sum of all values: \(sum)")
}


example(of: "Linked list cow") {
	var list1 = LinkedList<Int>()
	list1.append(next: 1)
	list1.append(next: 2)

	var list2 = list1
	print("List1: \(list1)")
	print("List2: \(list2)")
	
	print("After appending 3 to list2")
	list2.append(next: 3)
	
	print("List1: \(list1)")
	print("List2: \(list2)")
}
