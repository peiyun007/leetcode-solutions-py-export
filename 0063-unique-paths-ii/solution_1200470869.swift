class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let m = obstacleGrid.count
        let n = obstacleGrid[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count:m)
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 && j == 0 {
                    dp[i][j] = obstacleGrid[i][j] == 1 ? 0 : 1
                } else if i == 0 {
                    dp[i][j] += (obstacleGrid[i][j-1] == 1 ? 0 : dp[i][j-1])
                } else if j == 0 {
                    dp[i][j] += (obstacleGrid[i-1][j] == 1 ? 0 : dp[i-1][j])
                } else {
                    dp[i][j] += (obstacleGrid[i][j-1] == 1 ? 0 : dp[i][j-1])
                    dp[i][j] += (obstacleGrid[i-1][j] == 1 ? 0 : dp[i-1][j])
                }
            }
        }
        return obstacleGrid[m-1][n-1] == 1 ? 0 : dp[m-1][n-1]
    }
}