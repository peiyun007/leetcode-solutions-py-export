class Solution {
    // 参考力扣
    var m = 0, n = 0
    let dirs = [(-1,0), (1,0), (0,-1), (0,1)]
    
    func hitBricks(_ grid: [[Int]], _ hits: [[Int]]) -> [Int] {
        m = grid.count
        n = grid[0].count
        var copy = grid
        var size = m * n
        var uf = UnionFind(size+1)
        
        for hit in hits {
            copy[hit[0]][hit[1]] = 0
        }
        // 将下标为 0 的这一行的砖块与「屋顶」相连
        for j in 0..<n {
            if copy[0][j] == 1 {
                uf.union(getIndex(0, j), size)
            }
        }
        // 其余网格，如果是砖块向上、向左看一下，如果也是砖块，在并查集中进行合并
        for i in 1..<m {
            for j in 0..<n {
                if copy[i][j] == 1 {
                    if copy[i-1][j] == 1 {
                        uf.union(getIndex(i, j), getIndex(i-1, j))
                    } 
                    // 这里千万不能else if
                    if j - 1 >= 0 && copy[i][j-1] == 1 {
                        uf.union(getIndex(i, j), getIndex(i, j-1))
                    }
                }
            }
        }

        var res = Array(repeating: 0, count: hits.count)
        // 第 3 步：按照 hits 的逆序，在 copy 中补回砖块，把每一次因为补回砖块而与屋顶相连的砖块的增量记录到 res 数组中
        for k in (0..<hits.count).reversed() {
            let x = hits[k][0]
            let y = hits[k][1]
            if grid[x][y] == 0 {
                continue
            }
            let origin = uf.getSize(size)
            // 注意：如果补回的这个结点在第 1 行，要告诉并查集它与屋顶相连（逻辑同第 2 步）
            if x == 0 {
                uf.union(getIndex(x, y), size)
            }
            for dir in dirs {
                let nx = x + dir.0
                let ny = y + dir.1
                if nx < 0 || nx >= m || ny < 0 || ny >= n {
                    continue
                }
                if copy[nx][ny] == 1 {
                    uf.union(getIndex(x, y), getIndex(nx, ny))
                }
            }
            let current = uf.getSize(size)
            // 减去的 1 是逆向补回的砖块（正向移除的砖块），与 0 比较大小，是因为存在一种情况，添加当前砖块，不会使得与屋顶连接的砖块数更多
            let ans = max(0, current - origin - 1)
            res[k] = ans
            // 真正补上这个砖!!
            copy[x][y] = 1
        }
        return res
    }

    func getIndex(_ x: Int, _ y: Int) -> Int {
        return x * n + y
    }
}

class UnionFind {
    private var parent: [Int]
    private var size: [Int]

    init(_ n: Int) {
        parent = Array(repeating: 0, count: n)
        size = Array(repeating: 0, count: n)
        for i in 0..<n {
            parent[i] = i
            size[i] = 1
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
        if px > py {
            (px, py) = (py, px)
        }
        parent[px] = py
        size[py] += size[px]
    }

    func getSize(_ x: Int) -> Int {
        return size[find(x)]
    }
}