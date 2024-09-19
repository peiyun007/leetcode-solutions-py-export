class Solution {
    func findMaxFish(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        let uf = UnionFind(m * n)
        let dirs = [0, -1, 0, 1, 0]
        func getIndex(_ x: Int, _ y: Int) -> Int {
            return x * n + y
        }
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] > 0 {
                    for k in 0..<4 {
                        let nx = i + dirs[k]
                        let ny = j + dirs[k+1]
                        if nx >= 0 && nx < m && ny >= 0 && ny < n && grid[nx][ny] > 0 {
                            uf.union(getIndex(i, j), getIndex(nx, ny))
                        }
                    }
                }
            }
        }
        var res = 0
        var map = [Int: Int]()
        for i in 0..<m {
            for j in 0..<n {
                let pa = uf.find(getIndex(i, j))
                let newPa = map[pa, default: 0] + grid[i][j]
                map[pa] = newPa
                res = max(res, newPa)
            }
        }
        return res
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