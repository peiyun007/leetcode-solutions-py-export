class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: matrix[0].count + 1), count: matrix.count + 1)
        var ans = Int.max
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if i == 0 {
                    dp[i][j] = matrix[i][j]
                } else {
                    var a = dp[i-1][j]
                    if j - 1 >= 0 {
                        a = min(a, dp[i-1][j-1])
                    }
                    if j + 1 < matrix[0].count {
                        a = min(a, dp[i-1][j+1])
                    }
                    dp[i][j] = a + matrix[i][j]
                }
                if i == matrix.count - 1 {
                    ans = min(ans, dp[i][j])
                }
            }
        }
        return ans
    }
}