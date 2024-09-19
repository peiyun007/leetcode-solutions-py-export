class Solution {
    func countPairs(_ n: Int, _ edges: [[Int]]) -> Int {
        let uf = UnionFind(n)
        for e in edges {
            uf.union(e[0], e[1])
        }
        var res = 0
        for i in 0..<n {
            res += (n - uf.getSize(i))
        }
        return res / 2
    }
}

class UnionFind {
    private var parent: [Int]
    private var size: [Int]
    init(_ n: Int) {
        parent = Array(repeating: 0, count: n)
        size = Array(repeating: 1, count: n)
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
    }

    func getSize(_ x: Int) -> Int {
        return size[find(x)]
    }
}