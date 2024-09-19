class Solution {
    func countPaths(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var memo = Array(repeating: Array(repeating: -1, count: n), count: m)
        let dirs = [0, -1, 0, 1, 0]
        let mod = 1_0000_0000_7
        var res = 0
        for i in 0..<m {
            for j in 0..<n {
                res = (res + dfs(i, j)) % mod
            }
        }
        return res

        func dfs(_ i: Int, _ j: Int) -> Int {
            if memo[i][j] != -1 {
                return memo[i][j]
            }
            var res = 1
            for k in 0..<4 {
                let nx = i + dirs[k]
                let ny = j + dirs[k+1]
                if nx >= 0 && nx < m && ny >= 0 && ny < n && grid[nx][ny] > grid[i][j] {
                    res = (res + dfs(nx, ny)) % mod
                }
            }
            memo[i][j] = res
            return res
        }
    }
}