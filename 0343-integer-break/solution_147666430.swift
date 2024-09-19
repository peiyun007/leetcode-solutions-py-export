class Solution {
    func integerBreak(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        dp[1] = 1
        for i in 2...n {
            for j in 1..<i {
                dp[i] = max(dp[i], max(i - j, dp[i - j]) * max(j, dp[j]))
            }
        }
        return dp[n]
    }
}