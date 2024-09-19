class Solution {
    func countServers(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var rows = Array(repeating: 0, count: m)
        var cols = Array(repeating: 0, count: n)
        let uf = UnionFind(m*n)
        for i in 0..<m {
            var first = -1
            for j in 0..<n {
                if grid[i][j] == 1 {
                    if first != -1 {
                        uf.union(first, i * n + j)
                    } else {
                        first = i * n + j
                    }
                }
            }
        }
        for j in 0..<n {
            var first = -1
            for i in 0..<m {
                if grid[i][j] == 1 {
                    if first != -1 {
                        uf.union(first, i * n + j)
                    } else {
                        first = i * n + j
                    }
                }
            }
        }
        print(uf.size)
        var ans = 0
        for x in uf.size {
            if x > 1 {
                ans += x
            }
        }
        return ans
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