class Solution {
    var m = 0, n = 0
    let dirs = [0, -1, 0, 1, 0]
    func closedIsland(_ grid: [[Int]]) -> Int {
        var g = grid
        m = g.count
        n = g[0].count
        var ans = 0
        for i in 0..<m {
            for j in 0..<n {
                if g[i][j] == 0 && dfs(&g, i, j) {
                    ans += 1
                }
            }
        }
        return ans
    }

    func dfs(_ g: inout [[Int]], _ x: Int, _ y: Int) -> Bool {
        if x < 0 || x >= m || y < 0 || y >= n {
            return false
        }
        if g[x][y] != 0 {
            return true
        }
        g[x][y] = -1
        let ret1 = dfs(&g, x-1, y)
        let ret2 = dfs(&g, x+1, y)
        let ret3 = dfs(&g, x, y-1)
        let ret4 = dfs(&g, x, y+1)
        return ret1 && ret2 && ret3 && ret4
    }
}