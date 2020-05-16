import Foundation
// Array is suitable for stacks since they're first in last out. So array.append, or array.popLast can work well
public struct Stack<Element> {
	private var storage: [Element] = []
	
	public init() {}
}

extension Stack: CustomStringConvertible {
	public var description: String {
		let topDivider = "----top----\n"
		let bottomDivider = "\n-----------"
		
		let stackElements = storage
			.map { "\($0)" }
			.reversed()
			.joined(separator: "\n")
		
		return topDivider + stackElements + bottomDivider
	}
	
	public init(_ elements: [Element]) {
		storage = elements
	}
	
	public mutating func push(into element: Element) {
		storage.append(element)
	}
	
	@discardableResult
	public mutating func pop() -> Element? {
		return storage.popLast()
	}
	
	public func peek() -> Element? {
		return storage.last
	}
	
	public var isEmpty: Bool {
		return peek() == nil
	}
}

extension Stack: ExpressibleByArrayLiteral {
	public init(arrayLiteral elements: Element...) {
		storage = elements
	}
}