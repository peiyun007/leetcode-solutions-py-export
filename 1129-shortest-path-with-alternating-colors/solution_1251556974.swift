class Solution {
    struct Pair<T: Hashable, U: Hashable>: Hashable {
        let f: T
        let s: U
        
        init(_ f: T, _ s: U) {
            self.f = f
            self.s = s
        }
    }
    typealias PairTwo = Pair<Int, Int>
    
    func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
        var g = Array(repeating: [(Int, Int)](), count: n)
        for e in redEdges {
            g[e[0]].append((e[1], 0))
        }
        for e in blueEdges {
            g[e[0]].append((e[1], 1))
        }
        var queue = [(Int, Int)]()
        var visited = Set<PairTwo>()
        var dis = Array(repeating: -1, count: n)
        queue.append((0, 0))
        queue.append((0, 1))
        visited.insert(PairTwo(0, 0))
        visited.insert(PairTwo(0, 1))
        dis[0] = 0
        var step = 0
        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                size -= 1
                let (x, color) = queue.removeFirst()
                if dis[x] == -1 {
                    dis[x] = step
                }
                for (y, nxtColor) in g[x] {
                    if color != nxtColor && !visited.contains(PairTwo(y, nxtColor))  {
                        visited.insert(PairTwo(y, nxtColor))
                        queue.append((y, nxtColor))
                    }
                }
            }
            step += 1
        }
        return dis
    }
}