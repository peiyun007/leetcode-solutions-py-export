class Solution {
    func new21Game(_ n: Int, _ k: Int, _ maxPts: Int) -> Double {
        if k == 0 {
            return 1.0
        }
        var dp = Array(repeating: Double(0), count: k+maxPts)
        var sum = Double(0)
        for i in k..<k+maxPts {
            if i <= n {
                dp[i] = 1.0
            }
            sum += dp[i]
        }
        for i in (0..<k).reversed() {
            dp[i] = sum / Double(maxPts)
            sum = sum - dp[i+maxPts] + dp[i]
        }
        return dp[0]
    }
}