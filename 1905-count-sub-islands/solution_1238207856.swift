class Solution {
    var m = 0, n = 0
    let dirs = [0, -1, 0, 1, 0]
    func countSubIslands(_ grid1: [[Int]], _ grid2: [[Int]]) -> Int {
        m = grid2.count
        n = grid2[0].count
        var g = grid2
        var res = 0
        for i in 0..<m {
            for j in 0..<n {
                if g[i][j] == 1 {
                    if dfs(&g, grid1, i, j) {
                        res += 1
                    }
                }
            }
        }
        return res
    }

    func dfs(_ grid: inout [[Int]], _ grid1: [[Int]], _ x: Int, _ y: Int) -> Bool {
        if x < 0 || x >= m || y < 0 || y >= n {
            return true
        }
        if grid[x][y] != 1 {
            return true
        }
        grid[x][y] = 2
        var flag = true
        if grid1[x][y] == 0 {
            flag = false
        }
        let flag1 = dfs(&grid, grid1, x-1, y)
        let flag2 = dfs(&grid, grid1, x+1, y)
        let flag3 = dfs(&grid, grid1, x, y-1)
        let flag4 = dfs(&grid, grid1, x, y+1)
        return flag && flag1 && flag2 && flag3 && flag4
    }
}