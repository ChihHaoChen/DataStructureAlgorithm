import Foundation
import PlaygroundSupport

public class Node<Value> {
	
	public var value: Value
	public var next: Node?
	
	public init(value: Value, next: Node? = nil) {
		self.value = value
		self.next = next
	}
}

extension Node: CustomStringConvertible {
	public var description: String {
		guard let next = next else {
			return "\(value)"
		}
		return "\(value) ->" + String(describing: next) + " "
	}
}

public struct LinkedList<Value> {
	public var head: Node<Value>?
	public var tail: Node<Value>?
	
	public init() {}
	
	public var isEmpty: Bool {
		return head == nil
	}
	
	public mutating func push(next value: Value) {
		copyNodes()
		head = Node(value: value, next: head)
		if tail == nil {
			tail = head
		}
	}
	
	
	public mutating func append(next value: Value) {
		copyNodes()
		// 1
		guard !isEmpty else {
			push(next: value)
			return
		}
		
		// 2
		tail!.next = Node(value: value)
		
		// 3
		tail = tail!.next
	}
	
	
	public func node(at index: Int) -> Node<Value>? {
		// 1
		var currentNode = head
		var currentIndex = 0
		
		// 2
		while currentNode != nil && currentIndex <  index {
			currentNode = currentNode!.next
			currentIndex += 1
		}
		return currentNode
	}
	
	
	@discardableResult
	public mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
		copyNodes()
		// 1 if inserting a new node in the end
		guard tail !== node else {
			append(next: value)
			return tail!
		}
		// 2 to link the new node
		node.next = Node(value: value, next: node.next)
		
		return node.next!
	}
	
	
	@discardableResult
	public mutating func pop() -> Value? {
		copyNodes()
		defer {
			head = head?.next
			if isEmpty {
				tail = nil
			}
		}
		return head?.value
	}
	
	
	@discardableResult
	public mutating func removeLast() -> Value? {
		copyNodes()
		// 1
		guard let head = head else { return nil }
		// 2
		guard head.next != nil else { return pop() }
		// 3
		var prev = head
		var current = head
		
		while let next = current.next {
			prev = current
			current = next
		}
		// 4
		prev.next = nil
		tail = prev
		return current.value
	}
	
	
	@discardableResult
	public mutating func remove(after node: Node<Value>) -> Value? {
		copyNodes()
		
		defer {
			if node.next === tail {
				tail = node
			}
			node.next = node.next?.next
		}
		return node.next?.value
	}
	
	
	public mutating func copyNodes() {
		guard var oldNode = head else {
			return
		}
		
		guard !isKnownUniquelyReferenced(&head) else { return }
		
		head = Node(value: oldNode.value)
		var newNode = head
		
		while let nextOldNode = oldNode.next {
			newNode!.next = Node(value: nextOldNode.value)
			newNode = newNode!.next
			
			oldNode = nextOldNode
		}
		tail = newNode
	}
}

extension LinkedList: CustomStringConvertible {
	public var description: String {
		guard let head = head else {
			return "Empty List"
		}
		return String(describing: head)
	}
}

extension LinkedList: Collection {
	public struct Index: Comparable {
		
		public var node: Node<Value>?
		
		static public func == (lhs: Index, rhs: Index) -> Bool {
			switch (lhs.node, rhs.node) {
				case let (left?, right?):
					return left.next === right.next
				case (nil, nil):
					return true
				default:
					return false
			}
		}
		
		static public func <(lhs: Index, rhs: Index) -> Bool {
			guard lhs != rhs else {
				return false
			}
			
			let nodes = sequence(first: lhs.node) { $0?.next }
			
			return nodes.contains { $0 === rhs.node }
		}
	}
	
	// 1
	public var startIndex: Index {
		return Index(node: head)
	}
	
	// 2
	public var endIndex: Index {
		return Index(node: tail?.next)
	}
	
	// 3
	public func index(after i: Index) -> Index {
		return Index(node: i.node?.next)
	}
	
	// 4
	public subscript(position: Index) -> Value {
		return position.node!.value
	}
}

