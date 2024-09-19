class Solution {
    func longestCycle(_ edges: [Int]) -> Int {
        let n = edges.count
        var indegree = Array(repeating: 0, count: n)
        var queue = [Int]()
        for i in 0..<n {
            let x = edges[i]
            if x == -1 {
                continue
            }
            indegree[x] += 1
        }
        for i in 0..<n {
            if indegree[i] == 0 {
                queue.append(i)
            }
        }
        while !queue.isEmpty {
            let u = queue.removeFirst()
            let v = edges[u]
            if v == -1 {
                continue
            }
            indegree[v] -= 1
            if indegree[v] == 0 {
                queue.append(v)
            }
        }
        if (indegree.max() ?? 0) == 0 {
            return -1
        }

        var visited = Array(repeating: false, count: n)
        var res = 0
        for u in 0..<n {
            if indegree[u] == 0 || visited[u] {
                continue
            }
            res = max(res, bfs(u))
        }
        return res

        func bfs(_ x: Int) -> Int {
            var step = 0
            var u = x
            while true {
                if visited[u] {
                    return step
                }
                visited[u] = true
                u = edges[u]
                step += 1
            }
        }

    }
}