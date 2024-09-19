class Solution {
    func fib(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n)
        if n == 0 {
            return 0
        }
        if n <= 2 {
            return 1
        }
        dp[0] = 1
        dp[1] = 1
        for i in 2..<n {
            dp[i] = dp[i-1] + dp[i-2]
        }
        return dp[n-1]
    }
}