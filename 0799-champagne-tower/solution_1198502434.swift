class Solution {
    /// 参考：花花酱 LeetCode 799
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        let maxN = 100
        var dp = Array(repeating: Array(repeating: Double(0), count: maxN), count: maxN)
        dp[0][0] = Double(poured)
        let row = min(query_row+2, maxN)
        for i in 0..<row-1 {
            for j in 0...i {
                if dp[i][j] > 1 {
                    dp[i+1][j] += (dp[i][j] - 1) / 2
                    dp[i+1][j+1] += (dp[i][j] - 1) / 2
                }
            }
        }
        return min(1, dp[query_row][query_glass])
    }
}