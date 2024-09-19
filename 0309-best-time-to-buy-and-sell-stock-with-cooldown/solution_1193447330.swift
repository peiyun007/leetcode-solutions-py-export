class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var sold = Int.min / 2   //今天把股票卖掉，能获得的最大利润。不能买也不能卖
        var holding = Int.min / 2   // 不能买，能卖
        var cooldown = 0   // 能买，不能卖
        for i in 0..<prices.count {
            let preSold = sold
            sold = holding + prices[i]
            holding = max(holding, cooldown - prices[i])
            cooldown = max(cooldown, preSold)
        }
        return max(sold, holding, cooldown)
    }
}