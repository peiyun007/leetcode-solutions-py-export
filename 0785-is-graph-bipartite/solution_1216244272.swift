class Solution {
    func isBipartite(_ g: [[Int]]) -> Bool {
        let n = g.count
        var colors = Array(repeating: 0, count: n)
        
        for i in 0..<n {
            if colors[i] != 0 {
                continue
            }
            colors[i] = 1
            var queue = [Int]()
            queue.append(i)
            while !queue.isEmpty {
                let cur = queue.removeFirst()
                
                for j in g[cur] {
                    if colors[j] == colors[cur] {
                        return false
                    }
                    if colors[j] != 0 {
                        continue
                    }
                    colors[j] = -colors[cur]
                    queue.append(j)
                }
            }
        }
        return true
    }
}