import Foundation

public struct BinarySearchTree<Element: Comparable> {
	
	public private(set) var root: BinaryNode<Element>?
	
	public init() {}
}


extension BinarySearchTree: CustomStringConvertible {
	
	public var description: String {
		return root?.description ?? "empty tree"
	}
}


extension BinarySearchTree {
	
	public mutating func insert(with value: Element) {
		root = insert(from: root, with: value)
	}
	
	
	private func insert(from node: BinaryNode<Element>?, with value: Element) -> BinaryNode<Element> {
		// 1
		guard let node = node else {
			return BinaryNode(value: value)
		}
		// 2
		if value < node.value {
			node.leftChild = insert(from: node.leftChild, with: value)
		} else {
			node.rightChild = insert(from: node.rightChild, with: value)
		}
		// 3
		return node
	}
	
	
	public func contains(_ value: Element) -> Bool {
		guard let root = root else { return false }
		
		var found = false
		
		root.traverseInOrder {
			if $0 == value {
				found = true
			}
		}
		return found
	}
	
	
	public func containsOptimized(_ value: Element) -> Bool {
		// 1
		var current = root
		
		// 2
		while let node = current {
			// 3
			if node.value == value {
				return true
			}
			if value < node.value {
				current = node.leftChild
			} else {
				current = node.rightChild
			}
		}
		return false
	}
	
	
	private func remove(node: BinaryNode<Element>?, value: Element) -> BinaryNode<Element>? {
		guard let node = node else { return nil }
		
		if value == node.value {
			// 1
			if node.leftChild == nil && node.rightChild == nil { // remove the leaf without connected nodes
				return nil
			}
			// 2
			if node.leftChild == nil {
				return node.rightChild
			}
			// 3
			if node.rightChild == nil {
				return node.leftChild
			}
			// 4
			node.value = node.rightChild!.min.value // to replace the node's value with the smallest value from the right subtree
			node.rightChild = remove(node: node.rightChild, value: node.value) // to remove the swapped value
			
		} else if value < node.value {
			node.leftChild = remove(node: node.leftChild, value: value)
		} else {
			node.rightChild = remove(node: node.rightChild, value: value)
		}
		return node
	}
	
	
	public mutating func remove(_ value: Element) {
		root = remove(node: root, value: value)
	}
}
