class Solution {
    func openLock(_ deadends: [String], _ target: String) -> Int {
        func atois(_ s: String) -> [Int] {
            var ans = [Int]()
            for ch in s {
                ans.append(Int(String(ch)) ?? 0)
            }
            return ans
        }
        var ds = Set<[Int]>(deadends.map { atois($0) })
        var tt = atois(target)
        var start = [0,0,0,0]
        var visited = [[Int]: Bool]()
        
        if ds.contains(start) || ds.contains(tt) {
            return -1
        }
        if start == tt {
            return 0
        }
        var queue = [[Int]]()
        queue.append(start)
        var step = 0
        while !queue.isEmpty {
            var size = queue.count
            step += 1
            while size > 0 {
                var cur = queue.removeFirst()
                for i in 0..<4 {
                    for j in stride(from: -1, to: 1+1, by: 2) {
                        var next = cur
                        next[i] = (next[i] + j + 10) % 10
                        if next == tt {
                            return step
                        }
                        if visited[next] != nil || ds.contains(next) {
                            continue
                        }
                        visited[next] = true
                        queue.append(next)
                    }
                }
                size -= 1
            }
        }
        return -1
    }
}