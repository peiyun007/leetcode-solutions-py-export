class Solution {
    var m = 0, n = 0
    func containsCycle(_ grid: [[Character]]) -> Bool {
        m = grid.count
        n = grid[0].count
        let uf = UnionFind(m*n)
        for i in 0..<m {
            for j in 0..<n {
                if i-1 >= 0 && grid[i][j] == grid[i-1][j] && uf.union(getIndex(i, j), getIndex(i-1, j))  {
                    return true
                }
                if j-1 >= 0 && grid[i][j] == grid[i][j-1] && uf.union(getIndex(i, j), getIndex(i, j-1))  {
                    return true
                }
            }
        }
        return false
    }

    func getIndex(_ x: Int, _ y: Int) -> Int {
        return x * n + y
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
            return true
        }
        if px < py {
            (px, py) = (py, px)
        }
        parent[px] = py
        return false
    }
}