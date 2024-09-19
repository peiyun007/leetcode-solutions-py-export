class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        if n == 1 {
            return 5
        }
        var dp = Array(repeating: Array(repeating: 0, count: 5), count: n+1)
        for i in 0..<5 {
            dp[1][i] = 1
        }
        for i in 2...n {
            for j in 0..<5 {
                for k in 0...j {
                    dp[i][j] += dp[i-1][k]
                }
            }
        }
        var sum = 0
        for i in 0..<5 {
            sum += dp[n][i]
        }
        return sum
    }
}