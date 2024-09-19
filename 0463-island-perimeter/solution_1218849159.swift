class Solution {
    var m = 0, n = 0
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        var g = grid
        m = g.count
        n = g[0].count
        var ans = 0
        for i in 0..<m {
            for j in 0..<n {
                if g[i][j] == 1 {
                    ans += dfs(&g, i, j)
                }
            }
        }
        return ans
    }

    func dfs(_ g: inout [[Int]], _ x: Int, _ y: Int) -> Int {
        if x < 0 || x >= m || y < 0 || y >= n {
            return 1
        }
        if g[x][y] == 0 {
            return 1
        }
        if g[x][y] != 1 {
            return 0
        }
        g[x][y] = 2
        return dfs(&g, x-1, y) +
        dfs(&g, x+1, y) +
        dfs(&g, x, y-1) +
        dfs(&g, x, y+1)
    }
}