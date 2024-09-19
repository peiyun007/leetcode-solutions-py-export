class Solution {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var g = Array(repeating: [(Int, Int)](), count: n)
        for e in times {
            g[e[0]-1].append((e[1]-1, e[2]))
        }
        var dist = Array(repeating: Int.max, count: n)
        var visited = Array(repeating: false, count: n)
        var queue = [(Int, Int)]()
        dist[k-1] = 0
        queue.append((k-1, 0))
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            let u = cur.0
            // visited[u] = true
            for (v, t) in g[u] {
                if dist[u] + t < dist[v], !visited[v] {
                    dist[v] = dist[u] + t
                    queue.append((v, dist[v]))
                }
            }
        }
        let res = dist.max() ?? 0
        return res == Int.max ? -1 : res
    }
}