class Solution {
    func tallestBillboard(_ rods: [Int]) -> Int {
        var s = rods.reduce(0) { $0+$1 }
        var dp = Array(repeating: -1, count: s+1)
        dp[0] = 0
        for h in rods {
            var cur = dp
            for i in 0...s {
                if cur[i] < 0 { continue }
                if i+h <= s {
                    dp[i+h] = max(dp[i+h], cur[i])
                }
                dp[abs(i-h)] = max(dp[abs(i-h)], cur[i] + min(i, h))
            }
        }
        return dp[0]
    }
}