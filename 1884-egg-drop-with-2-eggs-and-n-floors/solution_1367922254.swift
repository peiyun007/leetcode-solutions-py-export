class Solution {
    func twoEggDrop(_ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: Int.max, count: n+1), count: 2)
        dp[0][0] = 0
        dp[1][0] = 0
        for i in 1...n {
            dp[0][i] = i
        }
        for j in 1...n {
            for k in 1...j {
                dp[1][j] = min(dp[1][j], max(dp[0][k-1]+1, dp[1][j-k]+1))
            }
        }
        return dp[1][n]
    }
}