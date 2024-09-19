class Solution {
    func reachableNodes(_ n: Int, _ edges: [[Int]], _ restricted: [Int]) -> Int {
        var visited = Array(repeating: false, count: n)
        var g = [Int: [Int]]()
        var count = 0
        var set = Set<Int>(restricted)
        for e in edges {
            g[e[0], default: [Int]()].append(e[1])
            g[e[1], default: [Int]()].append(e[0])
        }

        func dfs(_ x: Int) {
            visited[x] = true
            count += 1
            guard let arr = g[x] else {
                return
            }
            for nxt in arr {
                if !visited[nxt] && !set.contains(nxt) {
                    dfs(nxt)
                }
            }
        }

        dfs(0)
        return count
    }

    
}