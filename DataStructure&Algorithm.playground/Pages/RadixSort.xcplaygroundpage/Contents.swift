
import Foundation

example(of: "radix sort") {
	var array = [88, 410, 1772, 20]
	
	print("Original array: \(array)")
	
	array.radixSort()
	
	print("Sorted array: \(array)")
}
