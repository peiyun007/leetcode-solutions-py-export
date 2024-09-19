class Solution {
    func getMaximumGold(_ grid0: [[Int]]) -> Int {
        var grid = grid0
        var ans = 0
        let dirs = [0, -1, 0, 1, 0]
        let m = grid.count, n = grid[0].count
        var gold = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] != 0 {
                    dfs(i, j, 0)
                }
            }
        }
        return ans

        func dfs(_ i: Int, _ j: Int, _ gold0: Int) {
            var gold = gold0
            gold += grid[i][j]
            ans = max(ans, gold)
            let rec = grid[i][j]
            grid[i][j] = 0
            for k in 0..<4 {
                let nx = i + dirs[k]
                let ny = j + dirs[k+1]
                if nx < 0 || nx >= m || ny < 0 || ny >= n || grid[nx][ny] == 0 { continue }
                dfs(nx, ny, gold)
            }
            grid[i][j] = rec
        }
    }
}