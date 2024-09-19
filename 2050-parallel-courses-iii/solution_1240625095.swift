class Solution {
    func minimumTime(_ n: Int, _ relations: [[Int]], _ time: [Int]) -> Int {
        var f = Array(repeating: 0, count: n)
        var g = Array(repeating: [Int](), count: n)
        var indegree = Array(repeating: 0, count: n)
        var queue = [Int]()
        for e in relations {
            g[e[0]-1].append(e[1]-1)
            indegree[e[1]-1] += 1
        }
        for i in 0..<n {
            if indegree[i] == 0 {
                queue.append(i)
            }
        }
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            f[cur] += time[cur]
            for nxt in g[cur] {
                f[nxt] = max(f[nxt], f[cur])
                indegree[nxt] -= 1
                if indegree[nxt] == 0 {
                    queue.append(nxt)
                }
            }
        }
        return f.max() ?? 0
    }
}