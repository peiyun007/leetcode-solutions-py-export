class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var dp = Array(repeating: 0, count: cost.count + 1)
        dp[0] = 0
        dp[1] = 0
        for i in 2...cost.count {
            dp[i] = min(dp[i - 2] + cost[i - 2], dp[i - 1] + cost[i - 1])
        }
        return dp[cost.count]
    }
}