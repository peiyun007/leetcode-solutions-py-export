class Solution {
    func colorBorder(_ grid: [[Int]], _ row: Int, _ col: Int, _ color: Int) -> [[Int]] {
        let m = grid.count
        let n = grid[0].count
        let dirs = [0, -1, 0, 1, 0]
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        let originColor = grid[row][col]
        var border = [(Int, Int)]()
        dfs(row, col)
        var g = grid
        for (x, y) in border {
            g[x][y] = color
        }
        return g

        func dfs(_ x: Int, _ y: Int) {
            var isBorder = false
            for i in 0..<4 {
                let nx = x + dirs[i]
                let ny = y + dirs[i+1]
                if nx < 0 || nx >= m || ny < 0 || ny >= n || grid[nx][ny] != originColor {
                    isBorder = true
                    continue
                } else if !visited[nx][ny] {
                    visited[nx][ny] = true
                    dfs(nx, ny)
                }
            }
            if isBorder {
                border.append((x, y))
            }
        }
    }
}