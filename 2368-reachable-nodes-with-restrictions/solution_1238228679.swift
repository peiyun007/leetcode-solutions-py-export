class Solution {
    func reachableNodes(_ n: Int, _ edges: [[Int]], _ restricted: [Int]) -> Int {
        let uf = UnionFind(n)
        let set = Set<Int>(restricted)
        for e in edges {
            if !set.contains(e[0]) && !set.contains(e[1]) {
                uf.union(e[0], e[1])
            }
        }
        return uf.getSize(0)
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