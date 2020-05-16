import Foundation

public class DoublyLinkedListNode<T> {
	var value: T
	var next: DoublyLinkedListNode?
	weak var previous: DoublyLinkedListNode?
	
	public init(value: T) {
		self.value = value
	}
}

extension DoublyLinkedListNode: CustomStringConvertible {
	public var description: String {
		guard let next = next else {
			return "\(value)"
		}
		return "\(value) ->" + String(describing: next) + " "
	}
}

public class DoublyLinkedList<T> {
	
	
	public typealias Node = DoublyLinkedListNode<T>
	
	private var head: Node?
	
	
	public init() {}
	
	
	public var isEmpty: Bool {
		return head == nil
	}
	
	
	public var first: Node? {
		return head
	}
	
	
	public var last: Node? {
		guard var node = head else { return nil }
		
		while let next = node.next {
			node = next
		}
		
		return node
	}
	
	
	public var count: Int {
		guard var node = head else { return 0 }
		
		var count = 1
		while let next = node.next {
			node = next
			count += 1
		}
		
		return count
	}
	
	
	public func node(at index: Int) -> Node {
		assert(head != nil, "List is empty.")
		assert(index >= 0, "Index must be greater or equal to 0.")
		
		if index == 0 {
			return head!
		}
		else {
			var node = head!.next
			
			for _ in 1..<index {
				node = node?.next
				if node == nil { break }
			}
			
			assert(node != nil, "Index is out of bounds.")
			
			return node!
		}
	}
	
	
	public subscript(index: Int) -> T {
		let node = self.node(at: index)
		
		return node.value
	}
	
	
	public func append(with node: Node) {
		let newNode = node
		if let lastNode = last {
			newNode.previous = lastNode
			lastNode.next = newNode
		} else {
			head = newNode
		}
	}
	
	
	public func append(_ value: T) {
		let newNode = Node(value: value)
		append(with: newNode)
	}
	
	
	public func append(_ list: DoublyLinkedList) {
		var nodeToCopy = list.head
		
		while let node = nodeToCopy {
			append(with: node)
			nodeToCopy = node.next
		}
	}
	
	
	public func insert(_ value: T, at index: Int) {
		let newNode = Node(value: value)
		insert(newNode, at: index)
	}
	
	
	public func insert(_ newNode: Node, at index: Int) {
		if index == 0 {
			newNode.next = head
			head?.previous = newNode
			head = newNode
		}	else {
			let prev = node(at: index-1)
			let next = prev.next
			newNode.previous = prev
			newNode.next = next
			
			next?.previous = newNode
			prev.next = newNode
		}
	}
	
	
	public func insert(_ list: DoublyLinkedList, at index: Int) {
		guard !list.isEmpty else { return }
		
		if index == 0 {
			list.last?.next = head
			head?.previous = list.last
			head = list.head
		}	else {
			let prev = node(at: index-1)
			let next = prev.next
			
			list.head?.previous = prev
			list.last?.next = next
			
			next?.previous = list.last
			prev.next = list.head
		}
	}
	
	
	public func removeAll() {
		head = nil
	}
	
	@discardableResult
	public func remove(node: Node)	-> T {
		let prev = node.previous
		let next = node.next
		
		if let prev = prev {
			prev.next = next
		} else {
			head = next
		}
		
		next?.previous = prev
		
		node.previous = nil
		node.next = nil
		
		return node.value
	}
	
	
	@discardableResult
	public func removeLast() -> T {
		assert(!isEmpty)
		
		return remove(node: last!)
	}
	
	
	@discardableResult
	public func remove(at index: Int) -> T {
		let node = self.node(at: index)
		
		return remove(node: node)
	}
}

extension DoublyLinkedList: CustomStringConvertible {
	public var description: String {
		guard let head = head else {
			return "Empty List"
		}
		return String(describing: head)
	}
}
