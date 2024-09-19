/*
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
*/

class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        var first = 0
        var second = 0
        var temp = 0
        for i in 2...cost.count {
            temp = second
            second = min(first + cost[i - 2], second + cost[i - 1])
            first = temp
        }
        return second
    }
}