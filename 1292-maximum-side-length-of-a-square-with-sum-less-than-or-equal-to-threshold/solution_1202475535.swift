class Solution {
    func maxSideLength(_ mat: [[Int]], _ threshold: Int) -> Int {
        let m = mat.count
        let n = mat[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
        for i in 1...m {
            for j in 1...n {
                dp[i][j] = dp[i-1][j] + dp[i][j-1] - dp[i-1][j-1] + mat[i-1][j-1]
            }
        }
        func rangeSum(_ x1: Int, _ y1: Int, _ x2: Int, _ y2: Int) -> Int {
            return dp[x2][y2] - dp[x1-1][y2] - dp[x2][y1-1] + dp[x1-1][y1-1]
        }
        var ans = 0
        for i in 1...m {
            for j in 1...n {
                let l = min(m, n)
                for k in 0...l {
                    if i + k > m || j + k > n {
                        break
                    }
                    if rangeSum(i, j, i+k, j+k) > threshold {
                        break
                    }
                    ans = max(ans, k+1)
                }
            }
        }
        return ans
    }
}