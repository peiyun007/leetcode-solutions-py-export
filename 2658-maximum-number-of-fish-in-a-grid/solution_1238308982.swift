class Solution {
    func findMaxFish(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var g = grid
        let dirs = [0, -1, 0, 1, 0]
        func dfs(_ x: Int, _ y: Int) -> Int {
            if g[x][y] == 0 {
                return 0
            }
            var ans = g[x][y]
            g[x][y] = 0
            for k in 0..<4 {
                let nx = x + dirs[k]
                let ny = y + dirs[k+1]
                if nx >= 0 && nx < m && ny >= 0 && ny < n && g[nx][ny] > 0 {
                    ans += dfs(nx, ny)
                }
            }
            return ans
        }
        var res = 0
        var map = [Int: Int]()
        for i in 0..<m {
            for j in 0..<n {
                res = max(res, dfs(i, j))
            }
        }
        return res
    }
}