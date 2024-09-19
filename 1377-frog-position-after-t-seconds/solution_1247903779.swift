class Solution {
    func frogPosition(_ n: Int, _ edges: [[Int]], _ t: Int, _ target: Int) -> Double {
        var g = Array(repeating: [Int](), count: n+1)
        var visited = Array(repeating: false, count: n+1)
        for e in edges {
            g[e[0]].append(e[1])
            g[e[1]].append(e[0])
        }
        return dfs(1, t)

        func dfs(_ i: Int, _ t: Int) -> Double {
            let nxt = i == 1 ? g[i].count : g[i].count - 1
            if t == 0 || nxt == 0 {
                return i == target ? 1.0 : 0.0
            }
            visited[i] = true
            var ans: Double = 0.0
            for x in g[i] {
                if !visited[x] {
                    ans += dfs(x, t-1)
                }
            }
            return ans / Double(nxt)
        }
    }
}