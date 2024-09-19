class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var g = Array(repeating: [(Int, Int)](), count: n)
        for e in connections {
            g[e[0]].append((e[1], 1))
            g[e[1]].append((e[0], 0))
        }
        return dfs(-1, 0)

        func dfs(_ from: Int, _ x: Int) -> Int {
            var res = 0
            for (y, flag) in g[x] {
                if y == from {
                    continue
                }
                if flag == 1 {
                    res += 1
                }
                res += dfs(x, y)
            }
            return res
        }
    }
}