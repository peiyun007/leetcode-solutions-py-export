class Solution {
    func numSquares(_ n: Int) -> Int {
        var dp = Array(repeating: 0, count: n + 1)
        for i in 1...n {
            dp[i] = i
            let x = Int(sqrt(Double(i)))
            for j in 1...x {
                dp[i] = min(dp[i], dp[i - j * j] + 1)
            }
        }
        return dp[n]
    }
}