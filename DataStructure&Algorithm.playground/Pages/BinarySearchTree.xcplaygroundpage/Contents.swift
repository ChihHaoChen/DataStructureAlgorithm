
import Foundation

example(of: "building a BST") {
	var bst = BinarySearchTree<Int>()
	
	for i in 0..<5 {
		bst.insert(with: i)
	}
	
	print(bst)
}


var exampleTree: BinarySearchTree<Int> {
	var bst = BinarySearchTree<Int>()
	
	bst.insert(with: 3)
	bst.insert(with: 1)
	bst.insert(with: 4)
	
	bst.insert(with: 0)
	bst.insert(with: 2)
	bst.insert(with: 5)
	
	return bst
}


example(of: "building a BST") {
	print(exampleTree)
}


example(of: "finding a node") {
	if exampleTree.containsOptimized(5) {
		print("Found 5!")
	} else {
		print("Couldn't find 5")
	}
}


example(of: "removing a node") {
	var tree = exampleTree
	print("Tree before the removal")
	print(tree)
	
	tree.remove(3)
	
	print("Tree after the removal")
	print(tree)
	
}


example(of: "building an unbalanced BST") {
	var unbalancedBst = BinarySearchTree<Int>()
	
	for i in 0..<15 {
		unbalancedBst.insert(with: i)
	}
	
	print(unbalancedBst)
}
