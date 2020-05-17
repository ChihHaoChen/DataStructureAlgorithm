
var arrayUnsorted0 = [12, 0, 3, 9, 2, 18, 8, 27, 1, 5, 8, -1, 21]
var arrayUnsorted1 = [12, 0, 3, 9, 2, 18, 8, 27, 1, 5, 8, -1, 21]
var arrayUnsorted2 = [12, 0, 3, 9, 2, 18, 8, 27, 1, 5, 8, -1, 21]
var arrayUnsorted3 = [12, 0, 3, 9, 2, 18, 8, 27, 1, 5, 8, -5, 21]
var arrayUnsorted4 = [12, 0, 3, 8, 9, 2, 21, 18, 27, 1, 5, 8, -1, 8]

print("Sorted by quickSortNaive")
print(quickSortNaive(arrayUnsorted0))


print("Sorted by quickSortLomuto")
quickSortLomuto(&arrayUnsorted1, low: 0, high: arrayUnsorted1.count - 1)
print(arrayUnsorted1)


print("Sorted by quickSortHoare")
quickSortHoare(&arrayUnsorted2, low: 0, high: arrayUnsorted2.count - 1)
print(arrayUnsorted2)


print("Sorted by quickSortMedian")
quickSortMedian(&arrayUnsorted3, low: 0, high: arrayUnsorted3.count - 1)
print(arrayUnsorted3)


print("Sorted by quickSortDutchFlag")
quickSortDutchFlag(&arrayUnsorted4, low: 0, high: arrayUnsorted4.count - 1)
print(arrayUnsorted4)
