/*
LIS를 구현하는 방법에는 크게 세 가지 방법이 있디.
문제에서 주어진 시간 복잡도에 따라 다른 방법을 적용하면 된다.
보통 1초 = 1억으로 가정하고, n = 10,000인 경우 n^2 = 100,000,000이다.
따라서 10,000이 넘어가면 시간 초과가 발생하므로 이 때는 O(nlogn)의 방법을 이용한다.
log(10,000) = 13이므로 130,000으로 시간복잡도가 확 줄어든 것을 볼 수 있다.
*/

// 1. LIS의 최대 길이만 구하는 방법 -> O(n^2)를 보장
func firstLIS(_ n: Int, _ arr: [Int]) {
    var dp = [Int](repeating: 1, count: n) // 항상 자기 자신을 갖고 있으므로 최소 길이 1

    for i in 1..<n {
        for j in 0..<i {
            if arr[i] > arr[j] { // 증가하는 부분 수열이므로 기준 원소가 더 커야함
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }

    print(dp.sorted(by: >).first!) // 내림차순으로 정렬 후에 첫 번째 원소 출력
}

// 2. LIS의 최대 길이만 구하는 방법 -> O(nlogn)을 보장
func secondLIS(_ n: Int, _ arr: [Int]) {
    var dp = [Int]()

    dp.append(arr[0]) // 첫 번째 원소는 그 자체만으로 증가하는 부분 수열이라고 볼 수 있으므로 dp에 삽입

    for i in 1..<n {
        if arr[i] > dp.last! { // dp의 마지막 원소보다 크면 증가하는 부분 수열이므로 dp에 추가
            dp.append(arr[i])
        } else { // lowerBound(이분 탐색)을 통해 현재 원소가 들어갈 자리를 탐색 후 교체
            let index = lowerBound(dp, arr[i])
            dp[index] = arr[i]
        }
    }

    print(dp.count) // dp는 LIS의 길이와 같음 -> LIS가 아닐 수 있음에 주의
}

// 2. LIS의 최대 길이와 실제 LIS까지 구하는 방법 -> O(nlogn)을 보장
func thirdLIS(_ n: Int, _ arr: [Int]) {
    var dp = [Int]()
    var temp = [Int]() // 들어갈 위치를 저장할 배열

    dp.append(arr[0]) // 첫 번째 원소는 그 자체만으로 증가하는 부분 수열이라고 볼 수 있으므로 dp에 삽입
    temp.append(0)

    for i in 1..<n {
        if arr[i] > dp.last! {
            dp.append(arr[i])
            temp.append(dp.count - 1)
        } else {
            let index = lowerBound(dp, arr[i])
            dp[index] = arr[i]
            temp.append(index)
        }
    }

    // temp에는 각 원소가 몇 번째 위치에 들어가는지 저장되어 있음
    // 특정 위치가 처음 등장할 떄의 원소가 진짜 LIS의 원소
    var lengthOfLIS = dp.count - 1
    var ans = [Int]()

    for i in stride(from: temp.count - 1, through: 0, by: -1) {
        if lengthOfLIS == temp[i] {
            ans.append(arr[i])
            lengthOfLIS -= 1
        }
    }
    
    // 역으로 탐색했으니 reverse
    ans.reverse()
    print(ans)
}

// target보다 크거나 같은 원소가 처음 등장하는 위치 -> 특정 원소가 들어갈 수 있는 위치
func lowerBound(_ arr: [Int], _ target: Int) -> Int {
    var start = 0
    var end = arr.count // arr.count - 1 이 아님에 주의
    var mid = 0

    while start < end {
        mid = (start + end) / 2

        if arr[mid] >= target {
            end = mid
        } else {
            start = mid + 1
        }
    }

    return start
}

let n = 6
let test = [10, 20, 10, 30, 20, 50]

firstLIS(n, test)
secondLIS(n, test)
thirdLIS(n, test)