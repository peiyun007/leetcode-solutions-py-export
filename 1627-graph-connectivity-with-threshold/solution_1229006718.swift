class Solution {
    func areConnected(_ n: Int, _ threshold: Int, _ queries: [[Int]]) -> [Bool] {
        let uf = UnionFind(n+1)
        for k in stride(from: threshold+1, through: n, by: 1) {
            for x in stride(from: 2*k, through: n, by: k) {
                uf.union(k, x)
            }
        }
        var res = [Bool]()
        for q in queries {
            res.append(uf.find(q[0]) == uf.find(q[1]))
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
    }

}