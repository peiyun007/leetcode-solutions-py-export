class Solution {
    var g = [[Int]]()
    var colors = [Int]()
    func possibleBipartition(_ n: Int, _ dislikes: [[Int]]) -> Bool {
        g = Array(repeating: [Int](), count: n)
        for d in dislikes {
            g[d[0]-1].append(d[1]-1)
            g[d[1]-1].append(d[0]-1)
        }
        colors = Array(repeating: 0, count: n)
        
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
                    if colors[cur] == colors[j] {
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