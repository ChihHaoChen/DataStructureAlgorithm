import Foundation

example(of: "repeated insertions in sequence_level_4") {
	var tree = AVLTree<Int>()
	
	for i in 0..<15 {
		tree.insert(with: i)
	}
	
	print(tree)
}

example(of: "repeated insertions in sequence_level_5") {
	var tree5 = AVLTree<Int>()
	
	for i in 0..<31 {
		tree5.insert(with: i)
	}
	
	print(tree5)
}


example(of: "removing a value") {
	var treeRemoval = AVLTree<Int>()
	
	treeRemoval.insert(with: 15)
	treeRemoval.insert(with: 10)
	treeRemoval.insert(with: 16)
	treeRemoval.insert(with: 18)
	
	print("***Before Removal***")
	print(treeRemoval)
	
	treeRemoval.remove(10)
	
	print("***After Removal***")
	print(treeRemoval)
}
