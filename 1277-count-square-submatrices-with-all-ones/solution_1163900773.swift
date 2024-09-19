class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        var res = 0
        let m = matrix.count
        let n = matrix[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if i == 0 || j == 0 {
                    dp[i][j] = matrix[i][j]
                } else if matrix[i][j] == 1 {
                    dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1
                }
                if dp[i][j] > 0 {
                    res += dp[i][j]
                }
            }
        }
        return res
    }
}