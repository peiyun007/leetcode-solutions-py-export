class Solution {
    func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
        let n = graph.count
        var rg = Array(repeating: [Int](), count: n)
        var inDeg = Array(repeating: 0, count: n)
        for x in 0..<n {
            for y in graph[x] {
                rg[y].append(x)
            }
            inDeg[x] = graph[x].count
        }
        var queue = [Int]()
        for i in 0..<n {
            if inDeg[i] == 0 {
                queue.append(i)
            }
        }
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            for x in rg[cur] {
                inDeg[x] -= 1
                if inDeg[x] == 0 {
                    queue.append(x)
                }
            }
        }
        var res = [Int]()
        for i in 0..<n {
            if inDeg[i] == 0 {
                res.append(i)
            }
        }
        return res
    }
}