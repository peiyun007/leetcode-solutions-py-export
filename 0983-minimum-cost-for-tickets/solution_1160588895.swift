class Solution {
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        let lastDay = days.last ?? 0
        var dp = Array(repeating: 0, count: lastDay+1)
        for day in days {
            dp[day] = -1
        }
        for i in 1...lastDay {
            if dp[i] == 0 {
                dp[i] = dp[i-1]
            } else {
                let a = costs[0] + dp[max(i-1, 0)]
                let b = costs[1] + dp[max(i-7, 0)]
                let c = costs[2] + dp[max(i-30, 0)]
                dp[i] = min(a, min(b, c))
            }
        }
        return dp[lastDay]
    }
}