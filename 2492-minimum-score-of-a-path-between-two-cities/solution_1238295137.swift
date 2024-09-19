class Solution {
    func minScore(_ n: Int, _ roads: [[Int]]) -> Int {
        let uf = UnionFind(n+1)
        var map = [Int: Int]()
        for e in roads {
            uf.union(e[0], e[1])
        }
        for e in roads {
            let pa = uf.find(e[0])
            map[pa] = min((map[pa] ?? Int.max), e[2])
        }
        return map[uf.find(1)] ?? -1
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
        parent[px] = py
        size[py] += size[px]
    }

    func getSize(_ x: Int) -> Int {
        return size[find(x)]
    }
}