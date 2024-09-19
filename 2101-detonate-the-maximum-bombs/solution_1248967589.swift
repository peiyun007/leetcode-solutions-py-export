class Solution {
    func maximumDetonation(_ bombs: [[Int]]) -> Int {
        let n = bombs.count
        var g = Array(repeating: [Int](), count: n)
        for i in 0..<n {
            for j in 0..<n {
                if i != j && isConnected(i, j) {
                    g[i].append(j)
                }
            }
        }

        var maxSize = 0
        for i in 0..<n {
            var visited = Array(repeating: false, count: n)
            let curSize = dfs(i, &visited)
            maxSize = max(maxSize, curSize)
        }
        return maxSize
        
        func isConnected(_ u: Int, _ v: Int) -> Bool {
            let dx = bombs[u][0] - bombs[v][0]
            let dy = bombs[u][1] - bombs[v][1]
            let r = bombs[u][2]
            return r * r >= dx * dx + dy * dy
        }

        func dfs(_ x: Int, _ visited: inout [Bool]) -> Int {
            if visited[x] {
                return 0
            }
            visited[x] = true
            var cnt = 1
            for y in g[x] {
                cnt += dfs(y, &visited)
            }
            return cnt
        }
    }
}