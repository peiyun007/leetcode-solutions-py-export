class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 && j == 0 {
                    dp[i][j] = 0 + grid[i][j]
                } else if i == 0 {
                    dp[i][j] = dp[i][j-1] + grid[i][j]
                } else if j == 0 {
                    dp[i][j] = dp[i-1][j] + grid[i][j]
                } else {
                    dp[i][j] = min(dp[i-1][j], dp[i][j-1]) + grid[i][j]
                }
            }
        }
        return dp[m-1][n-1]
    }
}