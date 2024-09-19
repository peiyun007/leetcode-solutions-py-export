class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        var dp = Array(repeating: 0, count: triangle.count + 1)
        for layer in (0..<triangle.count).reversed() {
            for j in 0...layer {
                dp[j] = min(dp[j], dp[j + 1]) + triangle[layer][j]
            }
        }
        return dp[0]
    }
}