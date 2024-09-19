class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        if amount == 0 {
            return 0
        }
        var dp = Array(repeating: Int.max / 2, count: amount + 1)
        dp[0] = 0
        for i in 1...amount {
            for coin in coins {
                if i >= coin {
                    dp[i] = min(dp[i], dp[i-coin] + 1)
                }
            }
        }
        return dp[amount] == Int.max / 2 ? -1 : dp[amount]
    }
}