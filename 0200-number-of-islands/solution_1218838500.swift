class Solution {
    var m = 0
    var n = 0
    func numIslands(_ grid: [[Character]]) -> Int {
        var g = grid
        m = g.count
        n = g[0].count
        var ans = 0
        for i in 0..<m {
            for j in 0..<n {
                if g[i][j] == "1" {
                    ans += 1
                    dfs(&g, i, j)
                }
            }
        }
        return ans
    }

    func dfs(_ g: inout [[Character]], _ x: Int, _ y: Int) {
        if x < 0 || x >= m || y < 0 || y >= n {
            return
        }
        if g[x][y] != "1" {
            return
        }
        g[x][y] = "2"
        dfs(&g, x-1, y)
        dfs(&g, x+1, y)
        dfs(&g, x, y-1)
        dfs(&g, x, y+1)
    }
}