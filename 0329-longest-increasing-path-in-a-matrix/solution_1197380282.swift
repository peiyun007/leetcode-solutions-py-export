class Solution {

    /// 参考：花花酱 LeetCode 329
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        let dirs = [[-1,0], [1,0], [0,-1], [0,1]]
        var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
        var cells = [(Int, Int, Int)]()
        for i in 0..<m {
            for j in 0..<n {
                cells.append((matrix[i][j], i, j))
            }
        }
        cells.sort { $0.0 > $1.0 }
        var ans = 0
        for c in cells {
            let i = c.1
            let j = c.2
            for k in 0..<dirs.count {
                let ki = i + dirs[k][0]
                let kj = j + dirs[k][1]
                if ki < 0 || ki >= m || kj < 0 || kj >= n {
                    continue
                }
                if matrix[i][j] >= matrix[ki][kj] {
                    continue
                }
                dp[i][j] = max(dp[i][j], dp[ki][kj] + 1)
            }
            ans = max(ans, dp[i][j])
        }
        return ans
    }
}