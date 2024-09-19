class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var pre_buy = 0, pre_sell = 0, buy = Int.min, sell = 0
        for price in prices {
            pre_buy = buy
            buy = max(pre_sell - price, pre_buy)
            pre_sell = sell
            sell = max(pre_buy + price, pre_sell)
        }
        return sell
    }
}