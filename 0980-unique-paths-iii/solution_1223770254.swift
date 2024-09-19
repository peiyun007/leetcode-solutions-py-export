class Solution {
    var m = 0, n = 0
    let dirs = [0, -1, 0, 1, 0]
    func uniquePathsIII(_ grid: [[Int]]) -> Int {
        var g = grid
        m = grid.count
        n = grid[0].count
        var sx = -1, sy = -1
        var num = 1
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 0 {
                    num += 1
                } else if grid[i][j] == 1 {
                    sx = i
                    sy = j
                }
            }
        }
        return dfs(&g, sx, sy, num)
    }

    func dfs(_ g: inout [[Int]], _ x: Int, _ y: Int, _ num: Int) -> Int {
        if x < 0 || x >= m || y < 0 || y >= n || g[x][y] == -1 {
            return 0
        }
        if g[x][y] == 2 {
            return num == 0 ? 1 : 0
        }
        g[x][y] = -1
        var ans = 0
        for i in 0..<4 {
            ans += dfs(&g, x+dirs[i], y+dirs[i+1], num-1)
        }
        g[x][y] = 0
        return ans
    }
}