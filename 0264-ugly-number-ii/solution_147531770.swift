class Solution {
    func nthUglyNumber(_ n: Int) -> Int {
        var dp = Array<Int>(repeating: 0, count: n)
        dp[0] = 1
        var t2 = 0, t3 = 0, t5 = 0
        for i in 1..<n {
            dp[i] = min(dp[t2] * 2, dp[t3] * 3, dp[t5] * 5)
            if dp[i] == dp[t2] * 2 {t2 += 1}
            if dp[i] == dp[t3] * 3 {t3 += 1}
            if dp[i] == dp[t5] * 5 {t5 += 1}
        }
        return dp[n - 1]
    }
}