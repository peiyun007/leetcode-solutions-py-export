class Solution {
    func finalPrices(_ prices: [Int]) -> [Int] {
        let n = prices.count
        var res = prices
        var stack = [Int]()
        for i in 0..<n {
            let x = prices[i]
            while !stack.isEmpty && x <= prices[stack[stack.count-1]] {
                let prev = stack.removeLast()
                res[prev] = prices[prev] - x
            }
            stack.append(i)
        }
        return res
    }
}