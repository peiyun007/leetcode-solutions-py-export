class Solution {

    func minCost(_ arr: [Character], _ i: Int, _ j: Int) -> Int {
        var ans = 0
        var l = i
        var r = j
        while l < r {
            if arr[l] != arr[r] {
                ans += 1
            }
            l += 1
            r -= 1
        }
        return ans
    }

    func palindromePartition(_ s: String, _ K: Int) -> Int {
        let arr = Array(s)
        let n = arr.count
        var dp = Array(repeating: Array(repeating: Int.max / 2, count: K+1), count: n)
        for i in 0..<n {
            dp[i][1] = minCost(arr, 0, i)
            if K < 2 {
                continue
            }
            for k in 2...K {
                for j in 0..<i {
                    dp[i][k] = min(dp[i][k], dp[j][k-1] + minCost(arr, j+1, i))
                }
            }
        }
        return dp[n-1][K]
    }
}