class Solution {
    let mod = 1_0000_0000_7
    func maxProductPath(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var f = Array(repeating: Array(repeating: 0, count: n), count: m)
        var g = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 {
                    if j == 0 {
                        f[i][j] = grid[i][j]
                        g[i][j] = f[i][j]
                    } else {
                        f[i][j] = f[i][j-1] * grid[i][j]
                        g[i][j] = f[i][j]
                    }
                } else if j == 0 {
                    f[i][j] = f[i-1][j] * grid[i][j]
                    g[i][j] = f[i][j]
                } else {
                    if grid[i][j] == 0 {
                        f[i][j] = 0
                        g[i][j] = 0
                    } else if grid[i][j] > 0 {
                        f[i][j] = max(f[i-1][j], f[i][j-1]) * grid[i][j]
                        g[i][j] = min(g[i-1][j], g[i][j-1]) * grid[i][j]
                    } else {
                        f[i][j] = min(g[i-1][j], g[i][j-1]) * grid[i][j]
                        g[i][j] = max(f[i-1][j], f[i][j-1]) * grid[i][j]
                    }
                }
            }
        }
        return f[m-1][n-1] >= 0 ? f[m-1][n-1] % mod : -1
    }
}