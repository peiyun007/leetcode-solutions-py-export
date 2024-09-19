class Solution {
    func latestDayToCross(_ row: Int, _ col: Int, _ cells: [[Int]]) -> Int {
        let size = row * col
        let uf = UnionFind(size + 2)
        let dirs = [0, -1, 0, 1, 0]
        var valid = Array(repeating: Array(repeating: false, count: col), count: row)
        for i in (0..<size).reversed() {
            let x = cells[i][0]-1
            let y = cells[i][1]-1
            valid[x][y] = true
            for i in 0..<4 {
                let nx = x + dirs[i]
                let ny = y + dirs[i+1]
                if nx < 0 || nx >= row || ny < 0 || ny >= col { continue }
                if valid[nx][ny] {
                    uf.union(getIndex(x, y), getIndex(nx, ny))
                }
            }
            if x == 0 {
                uf.union(getIndex(x, y), size)
            }
            if x == row - 1 {
                uf.union(getIndex(x, y), size+1)
            }
            if uf.find(size) == uf.find(size+1) {
                return i
            }
        }
        return 0

        func getIndex(_ x: Int, _ y: Int) -> Int {
            return x * col + y
        }
    }
    
}

class UnionFind {
    private var parents: [Int]
    private var size: Int

    init(_ n: Int) {
        self.size = n
        parents = Array(repeating: 0, count: n)
        for i in 0..<n {
            parents[i] = i
        }
    }

    func find(_ x: Int) -> Int {
        let px = parents[x]
        if px == x {
            return px
        }
        parents[x] = find(px)
        return parents[x]
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
        parents[px] = py
    }
}