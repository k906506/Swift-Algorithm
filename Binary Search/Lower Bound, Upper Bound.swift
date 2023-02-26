/// lower Bound를 찾는 메서드
/// array 내에서 target보다 크거나 같은 원소가 최초로 등장하는 index
func lowerBound(array: [Int], target: Int) -> Int {
    var start = 0
    var end = array.count // array.count-1 이 아님에 주의
    var mid = 0
    
    while start < end {
        // 1. target보다 크거나 같은 원소의 index를 발견
        // 범위의 끝에 포함되어 있는 경우를 위해 end = mid
        // -> 상한선을 줄인다.
        
        // 2. target보다 작은 원소의 index를 발견
        // 아직 target보다 작으므로 start = mid + 1
        // -> 하한선을 늘린다.
        
        mid = (start + end) / 2
        
        if array[mid] >= target { // 1.
            end = mid
        } else { // 2.
            start = mid + 1
        }
    }
    
    return start
}

/// upper bound를 찾는 메서드
/// array 내에서 target보다 큰 원소가 최초로 등장하는 index
func upperBound(array: [Int], target: Int) -> Int {
    var start = 0
    var end = array.count
    var mid = 0
    
    while start < end {
        // target보다 큰 원소가 최초로 등장하는 index를 찾는 것이므로
        // lower bound와 다르게 같을 경우에도 start = mid + 1 을 진행
        
        mid = (start + end) / 2
        
        if array[mid] <= target {
            start = mid + 1
        } else {
            end = mid
        }
    }
    
    return start
}

var array = [1, 2, 3, 3, 3, 4, 4, 4, 4]

print(lowerBound(array: array, target: 4))
print(upperBound(array: array, target: 4))