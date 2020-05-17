import Foundation


example(of: "AdjacencyList") {
	let graph = AdjacencyList<String>()

	let singapore = graph.createVertex(data: "Singapore")
	let tokyo = graph.createVertex(data: "Tokyo")
	let hongKong = graph.createVertex(data: "Hong Kong")
	let detroit = graph.createVertex(data: "Detroit")
	let montreal = graph.createVertex(data: "Montreal")
	let newYork = graph.createVertex(data: "New York")
	let austinTexas = graph.createVertex(data: "Austin Texas")
	let seattle = graph.createVertex(data: "Seattle")


	graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
	graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
	graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
	graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
	graph.add(.undirected, from: tokyo, to: newYork, weight: 300)
	graph.add(.undirected, from: hongKong, to: montreal, weight: 600)
	graph.add(.undirected, from: detroit, to: austinTexas, weight: 100)
	graph.add(.undirected, from: austinTexas, to: newYork, weight: 292)
	graph.add(.undirected, from: montreal, to: newYork, weight: 337)
	graph.add(.undirected, from: newYork, to: seattle, weight: 277)
	graph.add(.undirected, from: montreal, to: seattle, weight: 218)
	graph.add(.undirected, from: austinTexas, to: montreal, weight: 297)

	print(graph.description)

	graph.weight(from: singapore, to: tokyo)

	print("Montreal Outgoing Flights:")
	print("***************************")

	for edge in graph.edges(from: montreal) {
		print("from: \(edge.source.data) to: \(edge.destination.data)")
	}
}


example(of: "AdjacencyMatrix") {
	let graph = AdjacencyMatrix<String>()

	let singapore = graph.createVertex(data: "Singapore")
	let tokyo = graph.createVertex(data: "Tokyo")
	let hongKong = graph.createVertex(data: "Hong Kong")
	let detroit = graph.createVertex(data: "Detroit")
	let montreal = graph.createVertex(data: "Montreal")
	let newYork = graph.createVertex(data: "New York")
	let austinTexas = graph.createVertex(data: "Austin Texas")
	let seattle = graph.createVertex(data: "Seattle")


	graph.add(.undirected, from: singapore, to: hongKong, weight: 300)
	graph.add(.undirected, from: singapore, to: tokyo, weight: 500)
	graph.add(.undirected, from: hongKong, to: tokyo, weight: 250)
	graph.add(.undirected, from: tokyo, to: detroit, weight: 450)
	graph.add(.undirected, from: tokyo, to: newYork, weight: 300)
	graph.add(.undirected, from: hongKong, to: montreal, weight: 600)
	graph.add(.undirected, from: detroit, to: austinTexas, weight: 100)
	graph.add(.undirected, from: austinTexas, to: newYork, weight: 292)
	graph.add(.undirected, from: montreal, to: newYork, weight: 337)
	graph.add(.undirected, from: newYork, to: seattle, weight: 277)
	graph.add(.undirected, from: montreal, to: seattle, weight: 218)
	graph.add(.undirected, from: austinTexas, to: montreal, weight: 297)

	print(graph.description)

	graph.weight(from: singapore, to: tokyo)

	print("Tokyo Outgoing Flights:")
	print("***************************")

	for edge in graph.edges(from: tokyo) {
		print("from: \(edge.source.data) to: \(edge.destination.data)")
	}
}

