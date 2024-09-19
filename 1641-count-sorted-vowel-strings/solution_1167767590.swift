class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: 5), count: n+1)
        for i in 0..<5 {
            dp[1][i] = 1
        }
        if n == 1{
            return 5
        }
        for i in 2...n {
            dp[i][0] = dp[i - 1][0]
            for j in 1..<5 {
                dp[i][j] = dp[i][j-1] + dp[i-1][j]
            }
        }
        return dp[n][0] + dp[n][1] + dp[n][2] + dp[n][3] + dp[n][4]
    }
}