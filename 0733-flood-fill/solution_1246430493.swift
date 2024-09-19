class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        let originColor = image[sr][sc]
        var g = image
        let dirs = [0, -1, 0, 1, 0]
        let m = image.count
        let n = image[0].count
        if originColor == color {
            return image
        }
        g[sr][sc] = color
        dfs(sr, sc)
        return g
        func dfs(_ x: Int, _ y: Int) {
            for i in 0..<4 {
                let nx = x + dirs[i]
                let ny = y + dirs[i+1]
                if nx >= 0 && nx < m && ny >= 0 && ny < n && g[nx][ny] == originColor {
                    g[nx][ny] = color
                    dfs(nx, ny)
                }
            }
        }
    }
}