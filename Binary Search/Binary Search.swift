/// Binary Search로 정렬된 배열에서 target의 index를 찾는 메서드
/// O(logn)을 보장
func binarySearch(array: [Int], target: Int) -> Int {
    var start = 0
    var end = array.count - 1
    var mid = 0
    
    while start <= end {
        mid = (start + end) / 2
        
        if array[mid] > target { // target보다 값이 크므로 상한선을 줄인다.
            end = mid - 1
        } else if array[mid] < target { // target보다 값이 작으므로 하한선을 늘린다.
            start = mid + 1
        } else {
            return mid
        }
    }
    
    return 0 // target의 index를 찾지 못한 경우
}

var array = [1, 2, 3, 4, 5, 6, 7, 8, 9]

print(binarySearch(array: array, target: 4))