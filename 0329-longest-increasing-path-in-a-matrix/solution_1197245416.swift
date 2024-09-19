class Solution {
    var dp = [[Int]]()
    var n = 0
    let dirs = [[-1,0], [1,0], [0,-1], [0,1]]

    func dfs(_ matrix: [[Int]], _ m: Int, _ n: Int, _ i: Int, _ j: Int) -> Int {
        if dp[i][j] != -1 {
            return dp[i][j]
        }
        dp[i][j] = 1
        for k in 0..<dirs.count {
            let ki = i + dirs[k][0]
            let kj = j + dirs[k][1]
            if ki < 0 || ki >= m || kj < 0 || kj >= n || matrix[ki][kj] <= matrix[i][j] {
                continue
            }
            dp[i][j] = max(dp[i][j], 1 + dfs(matrix, m, n, ki, kj))
        }
        return dp[i][j]
    }

    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        let m = matrix.count
        let n = matrix[0].count
        dp = Array(repeating: Array(repeating: -1, count: n), count: m)
        var ans = 0
        for i in 0..<m {
            for j in 0..<n {
                ans = max(ans, dfs(matrix, m, n, i, j))
            }
        }
        return ans
    }
}