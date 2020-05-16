import Foundation

public class Trie<CollectionType: Collection> where CollectionType.Element: Hashable {
	public typealias Node = TrieNode<CollectionType.Element>
	
	private let root = Node(key: nil, parent: nil)
	
	public init() {}
	
	
	public func insert(_ collection: CollectionType) {
		// 1
		var current = root
		
		// 2
		for element in collection {
			if current.children[element] == nil {
				current.children[element] = Node(key: element, parent: current) // create a new node
			}
			current = current.children[element]! // move current to the next node
		}
		
		// 3
		current.isTerminating = true
	}
	
	
	public func contains(_ collection: CollectionType) -> Bool {
		var current = root
		
		for element in collection {
			guard let child = current.children[element] else {
				return false
			}
			current = child
		}
		return current.isTerminating
	}
	
	
	public func remove(_ collection: CollectionType) {
		// 1
		var current = root
		
		for element in collection {
			guard let child = current.children[element] else {
				return
			}
			current = child // point the current to the last node of the collection
		}
		
		guard current.isTerminating else {
			return
		}
		
		// 2
		current.isTerminating = false  // this allows the current node can be removed in the next step
		
		// 3
		while let parent = current.parent, current.children.isEmpty && !current.isTerminating {
			parent.children[current.key!] = nil
			current = parent  // backtrack the parent node
		}
	}
}


public extension Trie where CollectionType: RangeReplaceableCollection {
	
	func collections(startingWith prefix: CollectionType) -> [CollectionType] {
		// 1
		var current = root
		for element in prefix {
			guard let child = current.children[element] else {
				return []
			}
			current = child
		}
		// 2
		return collections(startingWith: prefix, after: current)
	}
	
	
	private func collections(startingWith prefix: CollectionType, after node: Node) -> [CollectionType] {
		// 1
		var results: [CollectionType] = []
		
		if node.isTerminating {
			results.append(prefix)
		}
		// 2
		for child in node.children.values {
			var prefix = prefix
			prefix.append(child.key!)
			
			results.append(contentsOf: collections(startingWith: prefix, after: child))
		}
		
		return results
	}
}
