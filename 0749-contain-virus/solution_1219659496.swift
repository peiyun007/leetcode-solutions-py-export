struct Pair<T: Hashable, U: Hashable>: Hashable {
    let f: T
    let s: U
}

typealias PairTwoInt = Pair<Int, Int>

class Solution {
    var m = 0, n = 0
    let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    func containVirus(_ isInfected: [[Int]]) -> Int {
        m = isInfected.count
        n = isInfected[0].count
        var g = isInfected
        var total_walls = 0

        
        while true {
            // 注意下面的这些变量一定要放到这里。这样每次循环要重新生成
            var nexts = [Set<PairTwoInt>]()
            var visited = Set<PairTwoInt>()

            var virus_area: (Set<PairTwoInt>) = []
            var block_next: (Set<PairTwoInt>) = []
            var block_walls: Int = -1

            for i in 0..<m {
                for j in 0..<n {
                    if g[i][j] != 1 || visited.contains(Pair(f: i, s: j)) {
                        continue
                    }
                    var curr = Set<PairTwoInt>()
                    var next = Set<PairTwoInt>()
                    var walls = 0
                    getArea(&g, i, j, &curr, &next, &walls, &visited)
                    if next.isEmpty { continue }
                    if block_walls == -1 || next.count > block_next.count {
                        virus_area = curr
                        block_next = next
                        block_walls = walls
                    }
                    nexts.append(next)
                }
            }
            if nexts.isEmpty {
                break
            }
            
            total_walls += block_walls
            for (idx, nxt) in nexts.enumerated() {
                if nxt == block_next {
                    for loc in virus_area {
                        g[loc.f][loc.s] = 2
                    }
                } else {
                    for loc in nxt {
                        g[loc.f][loc.s] = 1
                    }
                }
            }
        }
        return total_walls
    }

    func getArea(_ g: inout [[Int]], _ x: Int, _ y: Int, _ curr: inout Set<PairTwoInt>, _ next: inout Set<PairTwoInt>,
                 _ walls: inout Int, _ visited: inout Set<PairTwoInt>) {
        if x < 0 || x >= m || y < 0 || y >= n {
            return
        }
        if g[x][y] == 2 {
            return
        }
        if g[x][y] == 0 {
            walls += 1
            next.insert(Pair(f: x, s: y))
            return
        }
        if visited.contains(Pair(f: x, s: y)) {
            return
        }
        curr.insert(Pair(f: x, s: y))
        visited.insert(Pair(f: x, s: y))
        for dir in dirs {
            getArea(&g, x + dir.0, y + dir.1, &curr, &next, &walls, &visited)
        }
    }
}