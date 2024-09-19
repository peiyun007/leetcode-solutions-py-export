class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var m = mat.count
        var n = mat[0].count
        var g = mat
        var seen = Array(repeating: Array(repeating: false, count: n), count: m)
        var queue = [(Int, Int)]()

        for i in 0..<m {
            for j in 0..<n {
                if mat[i][j] == 0 {
                    queue.append((i, j))
                    seen[i][j] = true
                }
            }
        }

        var step = 0
        let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        while !queue.isEmpty {
            var size = queue.count
            step += 1
            while size > 0 {
                size -= 1

                let cur = queue.removeFirst()
                for dir in dirs {
                    let x = cur.0 + dir.0
                    let y = cur.1 + dir.1
                    if x < 0 || x >= m || y < 0 || y >= n {
                        continue
                    }
                    if seen[x][y] {
                        continue
                    }
                    g[x][y] = step
                    seen[x][y] = true
                    queue.append((x, y))
                }
            }
        }
        return g
    }
}