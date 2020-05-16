
import Foundation

example(of: "merge sort") {
	let array = [7, 2, 6, 1, 3, 9, 5]
	
	print("Original: \(array)")
	
	print("Merged Sorted: \(mergeSort(array))")
}
