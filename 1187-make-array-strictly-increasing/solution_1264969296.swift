class Solution {
    func makeArrayIncreasing(_ arr1: [Int], _ arr2: [Int]) -> Int {
        let n = arr1.count
        let b = arr2.sorted(by: <)
        let kInf = Int.max
        let m = b.count
        var dp = Array(repeating: Array(repeating: kInf, count: min(m, n) + 1), count: n+1)
        dp[0][0] = -1
        for i in 1...n {
            for j in 0...min(i,m) {
                if arr1[i-1] > dp[i-1][j] {
                    dp[i][j] = arr1[i-1]
                }
                if j > 0 && dp[i-1][j-1] != kInf {
                    let idx = bsearch(b, dp[i-1][j-1])
                    if idx != b.count {
                        dp[i][j] = min(dp[i][j], b[idx])
                    } 
                }
                if i == n && dp[i][j] != kInf {
                    return j
                }
            }
        }
        return -1
    }

    func bsearch(_ arr: [Int], _ x: Int) -> Int {
        var left = 0, right = arr.count
        while left < right {
            let mid = left + (right - left) / 2
            if arr[mid] > x {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left
    }
}