class Solution {
    func countCompleteComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var g = Array(repeating: [Int](), count: n)
        for e in edges {
            g[e[0]].append(e[1])
            g[e[1]].append(e[0])
        }

        var v = 0
        var e = 0
        var ans = 0
        var visited = Array(repeating: false, count: n)
        for i in 0..<n {
            v = 0
            e = 0
            if !visited[i] {
                dfs(i)
                if e == v * (v - 1) {
                    ans += 1
                }
            }
        }
        return ans

        func dfs(_ x: Int) {
            visited[x] = true
            v += 1
            e += g[x].count
            for y in g[x] {
                if !visited[y] {
                    dfs(y)
                }
            }
        }
    }
}