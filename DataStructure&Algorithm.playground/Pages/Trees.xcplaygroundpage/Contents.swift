import Foundation
import PlaygroundSupport

example(of: "creating a tree", action: {
	let beverages = TreeNode("Beverages")
	
	let hot = TreeNode("Hot")
	let cold = TreeNode("Cold")
	
	beverages.add(hot)
	beverages.add(cold)
})


func makeBeverageTree() -> TreeNode<String> {
	let tree = TreeNode("Beverages")
	
	let hot = TreeNode("hot")
	let cold = TreeNode("cold")
	
	let tea = TreeNode("tea")
	let coffee = TreeNode("coffee")
	let chocolate = TreeNode("cocoa")
	
	let blackTea = TreeNode("black")
	let greenTea = TreeNode("green")
	let chaiTea = TreeNode("chai")
	
	let soda = TreeNode("soda")
	let milk = TreeNode("milk")
	
	let gingerAle = TreeNode("ginger ale")
	let bitterLemon = TreeNode("bitter lemon")
	
	tree.addNodes(with: [hot, cold])
	
	hot.addNodes(with: [tea, coffee, chocolate])
	
	cold.addNodes(with: [soda, milk])
	
	tea.addNodes(with: [blackTea, greenTea, chaiTea])
	
	soda.addNodes(with: [gingerAle, bitterLemon])
	
	return tree
}

example(of: "depth-first traversal") {
	let tree = makeBeverageTree()
	tree.forEachDepthFirst { print($0.value) }
}


example(of: "level-order traversal") {
	let tree = makeBeverageTree()
	tree.forEachLevelOrder { print($0.value) }
}


example(of: "searching for a node") {
	let tree = makeBeverageTree()
	
	if let searchResult1 = tree.search("ginger ale") {
		print("Found node: \(searchResult1.value)")
	}
	
	if let searchResult2 = tree.search("WKD Blue") {
		print("Found node: \(searchResult2.value)")
	} else {
		print("Couldn't find WKD Blue")
	}
}
