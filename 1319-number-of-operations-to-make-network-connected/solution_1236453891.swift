class Solution {
    func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
        if connections.count < n-1 {
            return -1
        }
        let uf = UnionFind(n)
        for e in connections {
            uf.union(e[0], e[1])
        }
        return uf.getCount() - 1
    }
}

class UnionFind {
    private var parent: [Int]
    private var count: Int
    var size: [Int]

    init(_ n: Int) {
        parent = Array(repeating: 0, count: n)
        size = Array(repeating: 1, count: n)
        count = n
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

    func union(_ x: Int, _ y: Int) {
        var px = find(x)
        var py = find(y)
        if px == py {
            return
        }
        if px < py {
            (px, py) = (py, px)
        }
        parent[px] = py
        size[py] += size[px]
        size[px] = 0
        count -= 1
    }

    func getCount() -> Int {
        return count
    }
}