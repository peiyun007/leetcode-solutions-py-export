class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let arr = Array(s)
        let n = arr.count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        for l in 1...n {
            for i in 0...n-l {
                let j = i + l - 1
                if i == j {
                    dp[i][j] = 1
                    continue
                }
                if arr[i] == arr[j] {
                    dp[i][j] = dp[i+1][j-1] + 2
                } else {
                    dp[i][j] = max(dp[i+1][j], dp[i][j-1])
                }
            }
        }
        return dp[0][arr.count-1]
    }
}