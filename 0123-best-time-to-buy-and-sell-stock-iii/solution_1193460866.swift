class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var buy_one = Int.min / 2
        var sell_one = Int.min / 2
        var buy_two = Int.min / 2
        var sell_two = Int.min / 2
        for i in 0..<prices.count {
            sell_two = max(sell_two, buy_two + prices[i])
            buy_two = max(buy_two, sell_one - prices[i])
            sell_one = max(sell_one, buy_one + prices[i])
            buy_one = max(buy_one, -prices[i])
        }
        return max(0, sell_one, sell_two)
    }
}