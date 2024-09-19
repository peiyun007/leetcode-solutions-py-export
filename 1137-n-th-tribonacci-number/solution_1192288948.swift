class Solution {
    func tribonacci(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: max(n+1, 3))
        dp[0] = 0
        dp[1] = 1
        dp[2] = 1
        if n <= 2 {
            return dp[n]
        }
        for i in 3...n {
            dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
        }
        return dp[n]
    }
}