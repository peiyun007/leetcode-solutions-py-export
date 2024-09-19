class Solution {
    func closestCost(_ baseCosts: [Int], _ toppingCosts: [Int], _ target: Int) -> Int {
        var ans = baseCosts.min() ?? 0
        for c in baseCosts {
            dfs(0, c)
        }
        return ans

        func dfs(_ i: Int, _ curCost: Int) {
            if abs(curCost - target) <= abs(ans - target) {
                if abs(curCost - target) < abs(ans - target) {
                    ans = curCost
                } else {
                    ans = min(ans, curCost)
                }
            }
            if i == toppingCosts.count {
                return
            }
            dfs(i+1, curCost + toppingCosts[i] * 2)
            dfs(i+1, curCost + toppingCosts[i] * 1)
            dfs(i+1, curCost + toppingCosts[i] * 0)
        }
    }
}