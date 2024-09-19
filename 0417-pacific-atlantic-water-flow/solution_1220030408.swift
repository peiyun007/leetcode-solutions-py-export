
class Solution {
    var m = 0, n = 0
    let dirs = [0, -1, 0, 1, 0]
    func pacificAtlantic(_ heights: [[Int]]) -> [[Int]] {
        m = heights.count
        n = heights[0].count
        var p = Array(repeating: Array(repeating: false, count: n), count: m)
        var a = Array(repeating: Array(repeating: false, count: n), count: m)
        
        for y in 0..<n {
            dfs(heights, 0, y, -1, &p)
            dfs(heights, m-1, y, -1, &a)
        }
        for x in 0..<m {
            dfs(heights, x, 0, -1, &p)
            dfs(heights, x, n-1, -1, &a)
        }
        var ans = [[Int]]()
        for i in 0..<m {
            for j in 0..<n {
                if p[i][j] && a[i][j] {
                    ans.append([i, j])
                }
            }
        }
        return ans
    }

    func dfs(_ g: [[Int]], _ x: Int, _ y: Int, _ h: Int, _ visited: inout [[Bool]]) {
        if x < 0 || x >= m || y < 0 || y >= n {
            return
        }
        if g[x][y] < h || visited[x][y] {
            return
        }
        visited[x][y] = true
        for i in 0..<4 {
            let nx = x + dirs[i]
            let ny = y + dirs[i+1]
            dfs(g, nx, ny, g[x][y], &visited)
        }
    }
}