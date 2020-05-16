import Foundation

extension Array where Element == Int {
	public mutating func radixSort() {
		// 1
		let base = 10
		// 2 flag to indicate whether the sort is complete
		var done = false
		var digits = 1
		while !done {
			done = true
			// 1 to instantiate the buckets using a 2-d array
			var buckets: [[Int]] = .init(repeating: [], count: base)
			// 2 place numbers in the correct bucket
			forEach { number in
				let remainingPart = number / digits
				let digit = remainingPart % base
				buckets[digit].append(number)
				
				if remainingPart > 0 {
					done = false
				}
			}
			print("Buckets = \(buckets)")
			// 3 flatMap flattens the 2d array to a 1d array
			digits *= base
			self = buckets.flatMap { $0 }
		}
	}
}
