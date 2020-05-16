import Foundation
import PlaygroundSupport

example(of: "using a stack") {
	var stack = Stack<Int>()
	
	stack.push(into: 1)
	stack.push(into: 2)
	stack.push(into: 3)
	stack.push(into: 4)
	
	print(stack)
	
	if let poppedElement = stack.pop() {
		assert(4 == poppedElement)
		print("Popped: \(poppedElement)")
	}
	
	print(stack)
	
	stack.peek()
}


example(of: "initializing a stack from an array") {
	
	let array = ["A", "B", "C", "D"]
	
	var stack = Stack<String>(array)
	print(stack)
	
	stack.pop()
	
}


example(of: "initializing a stack from an array literal") {
	var stack: Stack = [1.0, 2.0, 3.0, 4.0]
	
	print(stack)
	
	stack.pop()
}
