
import Foundation

let array = [1, 5, 15, 17, 19, 22, 24, 31, 100, 150]

let search31 = array.firstIndex(of: 31)
let binarySearch31 = array.binarySearch(for: 31, in: 0..<array.count)

print("index(of:): \(String(describing: search31))")

print("binarySearch(for:): \(String(describing: binarySearch31))")
