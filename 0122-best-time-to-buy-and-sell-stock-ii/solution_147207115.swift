class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var maxProfit = 0
        if prices.count == 0 {return 0}
        for i in 1 ..< prices.count {
            if (prices[i] > prices[i - 1]) {
                maxProfit += (prices[i] - prices[i - 1])
            }
        }
        return maxProfit
    }
}