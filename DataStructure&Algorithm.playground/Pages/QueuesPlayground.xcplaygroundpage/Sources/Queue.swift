import Foundation

public protocol Queue {
	associatedtype Element
	
	mutating func enqueue(into element: Element) -> Bool
	mutating func dequeue() -> Element?
	
	var isEmpty: Bool { get }
	var peek: Element? { get }
}


public struct QueueArray<T>: Queue {
	private var array: [T] = []
	public init() {}
	
	public var isEmpty: Bool {
		return array.isEmpty
	}
	
	public var peek: T? {
		return array.first
	}
	
	public mutating func enqueue(into element: T) -> Bool {
		array.append(element)
		
		return true
	}
	
	
	public mutating func dequeue() -> T? {
		return isEmpty ? nil : array.removeFirst()
	}
}


extension QueueArray: CustomStringConvertible {
	public var description: String {
		return array.description
	}
}


public class QueueLinkedList<T>: Queue {
	private var list = DoublyLinkedList<T>()
	
	public init() {}
	
	public func enqueue(into element: T) -> Bool {
		list.append(element)
		return true
	}
	
	public func dequeue() -> T? {
		guard !list.isEmpty, let _ = list.first else {
			return nil
		}
		return list.remove(at: 0)
	}
	
	public var peek: T? {
		return list.first?.value
	}
	
	public var isEmpty: Bool {
		return list.isEmpty
	}
}

extension QueueLinkedList: CustomStringConvertible {
	public var description: String {
		return list.description
	}
}


public struct QueueRingBuffer<T>: Queue {
	private var ringBuffer: RingBuffer<T>
	
	public init(count: Int) {
		ringBuffer = RingBuffer<T>(count: count)
	}
	
	
	public var isEmpty: Bool {
		return ringBuffer.isEmpty
	}
	
	
	public var peek: T? {
		return ringBuffer.first
	}
	
	
	public mutating func enqueue(into element: T) -> Bool {
		return ringBuffer.write(element)
	}
	
	
	public mutating func dequeue() -> T? {
		return isEmpty ? nil : ringBuffer.read()
	}
}


extension QueueRingBuffer: CustomStringConvertible {
	public var description: String {
		return ringBuffer.description
	}
}


