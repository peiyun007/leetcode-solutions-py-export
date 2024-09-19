class Solution {
    func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
        var g = Array(repeating: [Int](), count: n)
        for (i, x) in manager.enumerated() {
            if x != -1 {
                g[x].append(i)
            }
        }
        return dfs(headID)

        func dfs(_ x: Int) -> Int {
            var res = 0
            for y in g[x] {
                res = max(res, dfs(y))
            }
            return informTime[x] + res
        }
    }
}