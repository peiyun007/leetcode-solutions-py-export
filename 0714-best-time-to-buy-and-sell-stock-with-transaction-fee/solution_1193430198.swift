class Solution {
    func maxProfit(_ prices: [Int], _ fee: Int) -> Int {
        var sold = 0   // can buy
        var holding = Int.min / 2  // can sell
        for i in 0..<prices.count {
            let preSold = sold
            sold = max(sold, holding + prices[i] - fee)
            holding = max(holding, preSold - prices[i])
        }
        return sold
    }
}