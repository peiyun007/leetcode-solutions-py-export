class Solution {
    var m = 0
    var n = 0
    let dirs = [0, -1, 0, 1, 0]
    func numEnclaves(_ grid: [[Int]]) -> Int {
        m = grid.count
        n = grid[0].count
        let size = m * n
        let uf = UnionFind(size+1)
        var res = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    if i == 0 || i == m-1 || j == 0 || j == n-1 {
                        uf.union(getIndex(i, j), size)
                    }
                    for k in 0..<4 {
                        let nx = i + dirs[k]
                        let ny = j + dirs[k+1]
                        if nx < 0 || nx >= m || ny < 0 || ny >= n {
                            continue
                        }
                        if grid[nx][ny] != 1 {
                            continue
                        }
                        uf.union(getIndex(i, j), getIndex(nx, ny))
                    }
                }
            }
        }
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    if uf.find(getIndex(i, j)) != uf.find(size) {
                        res += 1
                    }
                }
            }
        }
        return res
    }

    func getIndex(_ i: Int, _ j: Int) -> Int {
        return i * n + j
    }
}

class UnionFind {
    private var parent: [Int]

    init(_ n: Int) {
        parent = Array(repeating: -1, count: n)
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
        if px > py {
            (px, py) = (py, px)
        }
        parent[px] = py
    }
}