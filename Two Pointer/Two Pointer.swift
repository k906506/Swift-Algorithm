/*
- 두 개의 포인터를 이용하여 리스트를 빠르게 탐색하는 기법
- 주로 "연속된" 부분 수열을 탐색할 때 사용
- 연속된 수열이므로 두 개의 포인터가 같은 위치에서 출발
*/

// "연속된" 수열의 합이 target과 같은 부분 수열의 개수
func twoPointer(_ arr: [Int], _ target: Int) -> Int {
    var left = 0
    var right = 0

    var cnt = 0
    var sum = 0

    while true {
        // target보다 크니까, 범위를 줄임 -> left 이동
        if sum >= target {
            if sum == target { cnt += 1 }
            
            sum -= arr[left]
            left += 1
        } else { // target보다 작으니까, 범위를 늘림 -> right 이동
            if right == arr.count { // 단, right를 이동시킬 수 없는 경우에는 left를 이동
                sum -= arr[left]
                left += 1
            } else {
                sum += arr[right]
                right += 1
            }
        }

        if left == arr.count { break } // left도 이동할 수 없는 경우에는 탐색 종료
    }

    return cnt
}

var arr1 = [10, 10, 10, 10, 10, 10, 10, 10, 10, 1]
var arr2 = [5, 1, 3, 5, 10, 7, 4, 9, 2, 8]
var arr3 = [1, 1, 1, 1, 1, 1, 1, 1, 10]

print(twoPointer(arr1, 1))
print(twoPointer(arr2, 15))
print(twoPointer(arr3, 10))