class Solution {
    func maximumInvitations(_ favorite: [Int]) -> Int {
        let n = favorite.count
        var indegree = Array(repeating: 0, count: n)
        var queue = [Int]()
        var maxLen = Array(repeating: 1, count: n)
        for v in favorite {
            indegree[v] += 1
        }
        for i in 0..<n {
            if indegree[i] == 0 {
                queue.append(i)
            }
        }
        while !queue.isEmpty {
            let u = queue.removeFirst()
            let v = favorite[u]
            maxLen[v] = maxLen[u] + 1
            indegree[v] -= 1
            if indegree[v] == 0 {
                queue.append(v)
            }
        }

        var maxRingSize = 0
        var sumChainSize = 0
        for u in 0..<indegree.count {
            if indegree[u] == 0  {
                continue
            }
            indegree[u] = 0
            var ringSize = 1
            var visited = Array(repeating: false, count: n)
            var v = favorite[u]
            while v != u {
                indegree[v] = 0
                ringSize += 1
                v = favorite[v]
            }
            if ringSize == 2 {
                sumChainSize += maxLen[u] + maxLen[favorite[u]]
            } else {
                maxRingSize = max(maxRingSize, ringSize)
            }
        }
        return max(maxRingSize, sumChainSize)
    }
}