class Solution {
    func minFallingPathSum(_ matrix: [[Int]]) -> Int {
        var dp = Array(repeating: 0, count: matrix[0].count)
        var ans = Int.max
        for i in 0..<matrix.count {
            var temp = dp
            for j in 0..<matrix[0].count {
                if i == 0 {
                    dp[j] = matrix[i][j]
                } else {
                    var a = temp[j]
                    if j - 1 >= 0 {
                        a = min(a, temp[j-1])
                    }
                    if j + 1 < matrix[0].count {
                        a = min(a, temp[j+1])
                    }
                    dp[j] = a + matrix[i][j]
                }
                if i == matrix.count - 1 {
                    ans = min(ans, dp[j])
                }
            }
            // dp = temp
        }
        return ans
    }
}