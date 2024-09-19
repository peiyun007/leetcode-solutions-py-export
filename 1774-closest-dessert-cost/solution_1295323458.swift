class Solution {
    func closestCost(_ baseCosts: [Int], _ toppingCosts: [Int], _ target: Int) -> Int {
        var x = baseCosts.min() ?? 0
        if x >= target {
            return x
        }
        var res = 2 * target - x
        var can = Array(repeating: false, count: target + 1)
        for b in baseCosts {
            if b <= target {
                can[b] = true
            } else {
                res = min(res, b)
            }
        }
        for i in toppingCosts {
            for _ in 0..<2 {
                for t in (0...target).reversed() {
                    if can[t] && i + t > target {
                        res = min(res, i+t)
                    }
                    if t-i > 0 {
                        can[t] = can[t] || can[t-i]
                    }
                }
            }
        }
        for i in 0...(res-target) {
            if can[target-i] {
                return target - i
            }
        }
        
        return res
    }
}
