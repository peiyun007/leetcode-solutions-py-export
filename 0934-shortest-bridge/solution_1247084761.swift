class Solution {
    func shortestBridge(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let dirs = [0, -1, 0, 1, 0]
        var g = grid
        var queue = [(Int, Int)]()
        var found = false
        for i in 0..<n {
            if found {
                break
            }
            for j in 0..<n {
                if g[i][j] == 1 {
                    dfs(i, j)
                    found = true
                    break
                }
            }
        }
        
        var step = 0
        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                let (x, y) = queue.removeFirst()
                for i in 0..<4 {
                    let nx = x + dirs[i]
                    let ny = y + dirs[i+1]
                    guard nx >= 0 && nx < n && ny >= 0 && ny < n else {
                        continue
                    }
                    if g[nx][ny] == 1 {
                        return step
                    }
                    if g[nx][ny] == 0 {
                        g[nx][ny] = -1
                        queue.append((nx, ny))
                    }
                }
                size -= 1
            }
            step += 1
        }
        return -1

        func dfs(_ x: Int, _ y: Int) {
            g[x][y] = -1
            queue.append((x, y))
            for i in 0..<4 {
                let nx = x + dirs[i]
                let ny = y + dirs[i+1]
                if nx >= 0 && nx < n && ny >= 0 && ny < n && g[nx][ny] == 1 {
                    dfs(nx, ny)
                }
            }
        }
    }
}