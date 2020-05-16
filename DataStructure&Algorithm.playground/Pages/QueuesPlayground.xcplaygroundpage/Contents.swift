//: [Previous](@previous)

import Foundation
import PlaygroundSupport


example(of: "Queue implmented with array") {
	var queue = QueueArray<String>()


	queue.enqueue(into: "Ray")
	queue.enqueue(into: "Brian")
	queue.enqueue(into: "Eric")

	queue.dequeue()

	queue

	queue.peek
}


example(of: "Queue implemented with linkedList") {
	let queueLinkedList = QueueLinkedList<String>()

	queueLinkedList.enqueue(into: "Ray")
	queueLinkedList.enqueue(into: "Brian")
	queueLinkedList.enqueue(into: "Eric")

	queueLinkedList

	queueLinkedList.dequeue()

	queueLinkedList

	queueLinkedList.peek

	queueLinkedList.enqueue(into: "Jenson")

	queueLinkedList

	queueLinkedList.peek
}


example(of: "Ring Buffer") {
	var buffer = RingBuffer<Int>(count: 5)

	buffer.write(123)
	buffer.write(456)
	buffer.write(789)
	buffer.write(666)

	buffer.read()   // 123
	buffer.read()   // 456
	buffer.read()   // 789

	buffer.write(333)
	buffer.write(555)

	buffer.read()   // 666
	buffer.read()   // 333
	buffer.read()   // 555
	buffer.read()   // nil
}


example(of: "Ring Buffer 2") {
	var queue = QueueRingBuffer<String>(count: 10)
	
	queue.enqueue(into: "Ray")
	queue.enqueue(into: "Brian")
	queue.enqueue(into: "Eric")
	
	queue
	
	queue.dequeue()
	
	queue
	
	queue.peek
}


