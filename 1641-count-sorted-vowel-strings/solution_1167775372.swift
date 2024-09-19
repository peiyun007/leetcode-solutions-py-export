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
            // dp[i][j]表示以第j个字符开头，长度为i的有序字符串的个数
            dp[i][0]=dp[i-1][0]+dp[i-1][1]+dp[i-1][2]+dp[i-1][3]+dp[i-1][4]
            dp[i][1]=dp[i-1][1]+dp[i-1][2]+dp[i-1][3]+dp[i-1][4]
            dp[i][2]=dp[i-1][2]+dp[i-1][3]+dp[i-1][4]
            dp[i][3]=dp[i-1][3]+dp[i-1][4]
            dp[i][4]=dp[i-1][4]
        }
        return dp[n][0] + dp[n][1] + dp[n][2] + dp[n][3] + dp[n][4]
    }
}