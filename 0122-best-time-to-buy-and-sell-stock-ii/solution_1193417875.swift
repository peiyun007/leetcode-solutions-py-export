class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0    // can buy
        var balance = Int.min   // can sell
        for i in 0..<prices.count {
            maxProfit = max(maxProfit, balance + prices[i])
            balance = max(balance, maxProfit - prices[i])
        }
        return maxProfit
    }
}