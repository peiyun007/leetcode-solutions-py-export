class Solution {

    func coinsChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = Array(repeating: Int.max, count: amount + 1)
        dp[0] = 0
        for i in 1...amount {
            for coin in coins {
                if i >= coin && dp[i-coin] != Int.max {
                    dp[i] = min(dp[i], 1+dp[i-coin])
                }
            }
        }
        return dp[amount] == Int.max ? -1 : dp[amount]
    }

    func minimumNumbers(_ num: Int, _ k: Int) -> Int {
        if num == 0 {
            return 0
        }
        var res = [Int]()
        for i in 1...num {
            if i % 10 == k {
                res.append(i)
            }
        }
        return coinsChange(res, num)
    }
}