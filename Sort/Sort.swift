// 1. 버블 정렬 : 거품이 올라오는 것처럼 앞에서부터 순차적으로 정렬
// 시간 복잡도 : O(n^2)
func bubbleSort(_ arr: [Int]) -> [Int] {
    var tempArr = arr
    
    for i in 0..<arr.count - 1 {
        for j in i + 1..<arr.count {
            if tempArr[i] > tempArr[j] {
                tempArr.swapAt(i, j) // i와 j의 값 변경
            }
        }
    }
    
    return tempArr
}

// 2. 선택 정렬 : 조건(최소, 최대)에 해당하는 원소만 선택적으로 이동
// 시간 복잡도 : O(n^2)
func selectSort(_ arr: [Int]) -> [Int] {
    var tempArr = arr
    
    for i in 0..<arr.count - 1 {
        var index = i
        
        // 최소 값 탐색
        for j in i + 1..<arr.count {
            if tempArr[index] > tempArr[j] {
                index = j
            }
        }
        
        if index == i { continue } // 최소 값이 없으면 변경하지 않음
        
        tempArr.swapAt(i, index)
    }
    
    return tempArr
}


// 3. 삽입 정렬 : 특정 원소가 들어갈 인덱스를 탐색 후 삽입
// 시간 복잡도 : O(n^2)
func insertSort(_ arr: [Int]) -> [Int] {
    var tempArr = arr
    
    for i in 1..<arr.count {
        let temp = tempArr[i]
        var j = i - 1
        
        // 기준이 되는 원소보다 클 경우, 배열 내 원소를 한 칸씩 이동
        while j >= 0, tempArr[j] > temp {
            tempArr[j + 1] = tempArr[j]
            j -= 1
        }
        
        tempArr[j + 1] = temp
    }
    
    return tempArr
}

// 4. 병합 정렬 : 나눠지기 전까지 나누고(분할), 정렬하고(정복), 합침
// 시간 복잡도 : O(nlogn)
func mergeSort(_ arr: [Int]) -> [Int] {
    if arr.count <= 1 { return arr }
    
    let mid = arr.count / 2
    let leftArray = mergeSort(Array(arr[..<mid]))
    let rightArray = mergeSort(Array(arr[mid...]))
    return merge(leftArray, rightArray)
    
    func merge(_ leftArray: [Int], _ rightArray: [Int]) -> [Int] {
        var left = 0
        var right = 0
        var result = [Int]()
        
        // 작은 원소부터 배열에 추가
        while left < leftArray.count, right < rightArray.count {
            let leftElement = leftArray[left]
            let rightElement = rightArray[right]
            
            if leftElement < rightElement {
                result.append(leftElement)
                left += 1
            } else if leftElement > rightElement {
                result.append(rightElement)
                right += 1
            } else {
                result.append(leftElement)
                result.append(rightElement)
                left += 1
                right += 1
            }
        }
        
        while left < leftArray.count {
            result.append(leftArray[left])
            left += 1
        }
        
        while right < rightArray.count {
            result.append(rightArray[right])
            right += 1
        }
        
        return result
    }
}

// 5. 퀵 정렬 : pivot을 정하고, 작은 원소는 왼쪽에, 큰 원소는 오른쪽으로 이동. 이후 분할 정복을 수행
// 시간 복잡도 : O(nlogn)
func quickSort(_ arr: [Int]) -> [Int] {
    if arr.count <= 1 { return arr }
    
    let pivot = arr[arr.count / 2]
    let leftArray = arr.filter { $0 < pivot }
    let midArray = arr.filter { $0 == pivot }
    let rightArray = arr.filter { $0 > pivot }
    
    return quickSort(leftArray) + midArray + quickSort(rightArray)
}

var arr1 = [9, 8, 7, 6, 5, 4, 3, 2, 1]

print(bubbleSort(arr1))
print(selectSort(arr1))
print(insertSort(arr1))
print(mergeSort(arr1))
print(quickSort(arr1))