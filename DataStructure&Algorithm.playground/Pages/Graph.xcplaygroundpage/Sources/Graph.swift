import Foundation


public enum EdgeType {
	case directed
	case undirected
}


public struct Edge<T> {
	public let source: Vertex<T>
	public let destination: Vertex<T>
	public let weight: Double?
}


public struct Vertex<T> {
	public var index: Int
	public let data: T
}


extension Vertex: Hashable {
	public var hashValue: Int {
		return index.hashValue
	}
	
	
	public static func == (lhs: Vertex, rhs: Vertex) -> Bool {
		return lhs.index == rhs.index
	}
}


public protocol Graph {
	
	associatedtype Element
	
	func createVertex(data: Element) -> Vertex<Element>
	
	func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
	
	func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?)
	
	func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
	
	func edges(from source: Vertex<Element>) -> [Edge<Element>]
	
	func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
}


extension Graph {
	public func addUndirectedEdge(between source: Vertex<Element>, and destination: Vertex<Element>, weight: Double?) {
		addDirectedEdge(from: source, to: destination, weight: weight)
		addDirectedEdge(from: destination, to: source, weight: weight)
	}
	
	
	public func add(_ edge: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
		
		switch edge {
			case .directed:
				addDirectedEdge(from: source, to: destination, weight: weight)
			case .undirected:
				addUndirectedEdge(between: source, and: destination, weight: weight)
		}
	}
}



