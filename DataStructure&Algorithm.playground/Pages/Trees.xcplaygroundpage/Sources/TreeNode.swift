import Foundation

public class TreeNode<T> {
	public var value: T
	public var children: [TreeNode] = []
	
	public init(_ value: T) {
		self.value = value
	}
	
	
	public func add(_ child: TreeNode) {
		children.append(child)
	}
		

	public func addNodes(with nodes: [TreeNode<T>]) -> Void {
		nodes.forEach { node in
			self.add(node)
		}
	}
}


extension TreeNode {
	public func forEachDepthFirst(visit: (TreeNode) -> Void) -> Void {
		visit(self)
		
		children.forEach {
			$0.forEachDepthFirst(visit: visit)
		}
	}
	
	
	public func forEachLevelOrder(visit: (TreeNode) -> Void) -> Void {
		
		visit(self)
		
		let queue = QueueLinkedList<TreeNode>()
		
		
		children.forEach {
			queue.enqueue(into: $0)
//			print("Node: \($0.value)\n")
		}
		
		while let node = queue.dequeue() {
			visit(node)
//			print("Node with value \(node.value) is visited.\n")

			node.children.forEach {
				queue.enqueue(into: $0)
			}
		}
	}
}


extension TreeNode where T: Equatable {
	public func search(_ value: T) -> TreeNode? {
		var result: TreeNode?
		
		forEachLevelOrder { node in
			if node.value == value	{
				result = node
			}
		}
		return result
	}
}
