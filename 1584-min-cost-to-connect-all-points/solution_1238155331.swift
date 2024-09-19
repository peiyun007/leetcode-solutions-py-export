class Solution {
    func minCostConnectPoints(_ points: [[Int]]) -> Int {
        let n = points.count
        let uf = UnionFind(n)
        var edges = [(Int, Int, Int)]()

        func dist(_ x: Int, _ y: Int) -> Int {
            return abs(points[x][0] - points[y][0]) + abs(points[x][1] - points[y][1])
        }
        for i in 0..<n-1 {
            for j in i+1..<n {
                edges.append((dist(i, j), i, j))
            }
        }
        edges.sort { $0.0 < $1.0 }
        var res = 0, num = 0
        for e in edges {
            if uf.union(e.1, e.2) {
                res += e.0
                num += 1
                if num == n - 1 {
                    break
                }
            }
        }
        return res
    }
    
}

class UnionFind {
    private var parent: [Int]
    init(_ n: Int) {
        parent = Array(repeating: 0, count: n)
        for i in 0..<n {
            parent[i] = i
        }
    }

    func find(_ x: Int) -> Int {
        let px = parent[x]
        if px == x {
            return x
        }
        parent[x] = find(px)
        return parent[x]
    }

    func union(_ x: Int, _ y: Int) -> Bool {
        var px = find(x)
        var py = find(y)
        if px == py {
            return false
        }
        if px < py {
            (px, py) = (py, px)
        }
        parent[px] = py
        return true
    }
}