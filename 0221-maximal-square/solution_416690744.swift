class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 {
            return 0
        }
        var dp = Array(repeating: Array(repeating: 0, count: matrix[0].count + 1), count: matrix.count + 1)
        var maxSize = 0
        for i in 1...matrix.count {
            let arr = matrix[i-1]
            for j in 1...arr.count {
                if matrix[i-1][j-1] == "1" {
                    dp[i][j] = min(dp[i][j-1], dp[i-1][j], dp[i-1][j-1]) + 1
                }
                maxSize = max(maxSize, dp[i][j])
            }
        }
        return maxSize * maxSize
    }
}