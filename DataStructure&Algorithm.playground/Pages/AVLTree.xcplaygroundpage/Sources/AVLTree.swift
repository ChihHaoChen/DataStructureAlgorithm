import Foundation

public struct AVLTree<Element: Comparable> {
	
	public private(set) var root: AVLNode<Element>?
	
	public init() {}
}


extension AVLTree: CustomStringConvertible {
	
	public var description: String {
		return root?.description ?? "empty tree"
	}
}


extension AVLTree {
	
	public mutating func insert(with value: Element) {
		root = insert(from: root, with: value)
	}
	
	
	private func insert(from node: AVLNode<Element>?, with value: Element) -> AVLNode<Element> {
		// 1
		guard let node = node else {
			return AVLNode(value: value)
		}
		// 2
		if value < node.value {
			node.leftChild = insert(from: node.leftChild, with: value)
		} else {
			node.rightChild = insert(from: node.rightChild, with: value)
		}
		// 3 check every node doesn't have any balance issues, and also update the node's height
		let balancedNode = balanced(node)
		balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
		
		return balancedNode
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
	
	
	private func remove(node: AVLNode<Element>?, value: Element) -> AVLNode<Element>? {
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
		// 5 check every node doesn't have any balance issues, and also update the node's height
		let balancedNode = balanced(node)
		balancedNode.height = max(balancedNode.leftHeight, balancedNode.rightHeight) + 1
		
		return balancedNode
	}
	
	
	public mutating func remove(_ value: Element) {
		root = remove(node: root, value: value)
	}
	
	
	private func leftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
		// 1
		let pivot = node.rightChild!
		// 2
		node.rightChild = pivot.leftChild
		// 3
		pivot.leftChild = node
		// 4
		node.height = max(node.leftHeight, node.rightHeight) + 1
		pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
		
		return pivot
	}
	
	
	private func rightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
		// 1
		let pivot = node.leftChild!
		// 2
		node.leftChild = pivot.rightChild
		// 3
		pivot.rightChild = node
		// 4
		node.height = max(node.leftHeight, node.rightHeight) + 1
		pivot.height = max(pivot.leftHeight, pivot.rightHeight) + 1
		
		return pivot
	}
	
	
	private func rightLeftRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
		guard let rightChild = node.rightChild else {
			return node
		}
		node.rightChild = rightRotate(node)
		
		return leftRotate(node)
	}
	
	
	private func leftRightRotate(_ node: AVLNode<Element>) -> AVLNode<Element> {
		guard let leftChild = node.leftChild else {
			return node
		}
		node.leftChild = leftRotate(node)
		
		return rightRotate(node)
	}
	
	
	private func balanced(_ node: AVLNode<Element>) -> AVLNode<Element> {
		switch node.balanceFactor {
			case 2:
				if let leftChild = node.leftChild, leftChild.balanceFactor < 0 {
					return leftRightRotate(node)
				} else {
					return rightRotate(node)
				}
			case -2:
				if let rightChild = node.rightChild, rightChild.balanceFactor > 0 {
					return rightLeftRotate(node)
				} else {
					return leftRotate(node)
			}
			default:
				return node
		}
	}
}
