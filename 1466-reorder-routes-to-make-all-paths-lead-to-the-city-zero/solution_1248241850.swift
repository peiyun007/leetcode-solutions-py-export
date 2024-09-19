class Solution {
    func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
        var g = Array(repeating: [(Int, Int)](), count: n)
        for e in connections {
            g[e[0]].append((e[1], 1))
            g[e[1]].append((e[0], 0))
        }
        var res = 0
        dfs(-1, 0)
        return res

        func dfs(_ from: Int, _ x: Int) {
            for (y, flag) in g[x] {
                if y == from {
                    continue
                }
                if flag == 1 {
                    res += 1
                }
                dfs(x, y)
            }
        }
    }
}