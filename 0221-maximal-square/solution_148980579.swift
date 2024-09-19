class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 {
            return 0
        }
        var dp = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        var maxSize = 0
        for i in 0..<matrix.count {
            let arr = matrix[i]
            for j in 0..<arr.count {
                if i == 0 || j == 0 {
                    dp[i][j] = Int(String(matrix[i][j])) ?? 0
                } else {
                    if matrix[i][j] == "1" {
                        let x = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])
                        dp[i][j] = x + 1
                    }
                }
                maxSize = max(maxSize, dp[i][j])
            }
        }
        return maxSize * maxSize
    }
}