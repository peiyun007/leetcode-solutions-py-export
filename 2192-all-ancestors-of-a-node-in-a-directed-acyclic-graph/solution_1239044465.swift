class Solution {
    func getAncestors(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
        var g = Array(repeating: [Int](), count: n)
        var anc = Array(repeating: Set<Int>(), count: n)
        var inDeg = Array(repeating: 0, count: n)
        for e in edges {
            g[e[0]].append(e[1])
            inDeg[e[1]] += 1
        }
        var queue = [Int]()
        for i in 0..<n {
            if inDeg[i] == 0 {
                queue.append(i)
            }
        }
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for nxt in g[cur] {
                anc[nxt].insert(cur)
                for i in anc[cur] {
                    anc[nxt].insert(i)
                }
                inDeg[nxt] -= 1
                if inDeg[nxt] == 0 {
                    queue.append(nxt)
                }
            }
        }
        var res = [[Int]]()
        for i in 0..<n {
            res.append(Array(anc[i]).sorted(by: <))
        }
        return res
    }
}