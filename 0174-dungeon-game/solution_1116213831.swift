class Solution {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        let m = dungeon.count
        let n = dungeon[0].count
        var dp = Array(repeating: Array(repeating: Int.max, count: n+1), count:m+1)
        dp[m][n-1] = 1
        dp[m-1][n] = 1
        for i in (0..<m).reversed() {
            for j in (0..<n).reversed() {
                dp[i][j] = min(dp[i][j+1], dp[i+1][j]) - dungeon[i][j]
                dp[i][j] = max(dp[i][j], 1)
            }
        }
        return dp[0][0]
    }
}