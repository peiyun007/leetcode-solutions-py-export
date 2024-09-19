class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        let n = triangle.count
        var dp = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
        for i in (0..<n).reversed() {
            for j in 0...i {
                dp[i][j] = min(dp[i+1][j], dp[i+1][j+1]) + triangle[i][j]
            }
        }
        return dp[0][0]
    }
}