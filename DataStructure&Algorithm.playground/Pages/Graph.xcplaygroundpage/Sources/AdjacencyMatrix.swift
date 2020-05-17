import Foundation


public class AdjacencyMatrix<T>: Graph {
	private var vertices: [Vertex<T>] = []
	private var weights: [[Double?]] = []
	
	public init() {}
	
	
	public func createVertex(data: T) -> Vertex<T> {
		let vertex = Vertex(index: vertices.count, data: data)
		
		vertices.append(vertex)
		// append a nil weight to every row in the matrix, as none of the current vertices have an edge to the new vertex
		for i in 0..<weights.count {
			weights[i].append(nil)
		}
		// Add a new row to the matrix, that holds the outgoing edges for the new vertex
		let row = [Double?](repeating: nil, count: vertices.count)
		weights.append(row)
		
		return vertex
	}
	
	
	public func addDirectedEdge(from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
		weights[source.index][destination.index] = weight
	}
	
	
	public func edges(from source: Vertex<T>) -> [Edge<T>] {
		var edges: [Edge<T>] = []
		for column in 0..<weights.count {
			if let weight = weights[source.index][column] {
				edges.append(Edge(source: source, destination: vertices[column], weight: weight))
			}
		}
		return edges
	}
	
	
	public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
		return weights[source.index][destination.index]
	}
}


extension AdjacencyMatrix: CustomStringConvertible {
	public var description: String {
		// 1 to create a list of the vertices
		let verticesDescription = vertices.map { "\($0)" }.joined(separator: "\n")
		// 2 to build a grid of weights
		var grid: [String] = []
		for i in 0..<weights.count {
			var row = ""
			for j in 0..<weights.count {
				if let value = weights[i][j] {
					row += "\(value)\t"
				} else {
					row += "0\t\t"
				}
			}
			grid.append(row)
		}
		let edgesDescription = grid.joined(separator: "\n")
		
		return "\(verticesDescription)\n\n\(edgesDescription)"
	}
}
