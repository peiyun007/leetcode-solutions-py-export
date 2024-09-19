class Solution {
    var dp = [String: Int]()
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var coinsSorted = coins.sorted { $0 < $1 }
        return dfs(coinsSorted, 0, amount)
    }

    func dfs(_ coins: [Int], _ i: Int, _ amount: Int) -> Int {
        if amount == 0 {
            return 1
        }
        if i >= coins.count {
            return 0
        }
        if coins[i] > amount {
            return 0
        }
        if let res = dp["\(amount)_\(i)"] {
            return res
        }
        let res = dfs(coins, i, amount - coins[i]) + dfs(coins, i+1, amount)
        dp["\(amount)_\(i)"] = res
        return res
    }
}