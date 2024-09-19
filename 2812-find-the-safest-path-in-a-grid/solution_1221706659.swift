class Solution {
    func maximumSafenessFactor(_ grid: [[Int]]) -> Int {
        var m = grid.count
        var n = grid[0].count
        let dirs = [0, -1, 0, 1, 0]
        var dis = Array(repeating: Array(repeating: -1, count: n), count: m)
        var queue = [(Int, Int)]()
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    dis[i][j] = 0
                    queue.append((i, j))
                }
            }
        }
        while !queue.isEmpty {
            let cur = queue.removeFirst()
            let x = cur.0
            let y = cur.1
            for i in 0..<4 {
                let nx = x + dirs[i]
                let ny = y + dirs[i+1]
                if nx < 0 || nx >= m || ny < 0 || ny >= n || dis[nx][ny] >= 0 {
                    continue
                }
                queue.append((nx, ny))
                dis[nx][ny] = dis[x][y] + 1
            }
        }

        func checkPath(_ lim: Int) -> Bool {
            var visited = Array(repeating: Array(repeating: false, count: n), count: m)
            var queue = [(Int, Int)]()
            queue.append((0, 0))
            while !queue.isEmpty {
                let cur = queue.removeFirst()
                let x = cur.0
                let y = cur.1
                if x == m - 1 && y == n - 1 {
                    return true
                }
                for i in 0..<4 {
                    let nx = x + dirs[i]
                    let ny = y + dirs[i+1]
                    if nx < 0 || nx >= m || ny < 0 || ny >= n || dis[nx][ny] < lim || visited[nx][ny] {
                        continue
                    }
                    queue.append((nx, ny))
                    visited[nx][ny] = true
                }
            }
            return false
        }
        
        var l = 0, r = min(dis[0][0], dis[m-1][n-1])
        while l < r {
            let mid = (l + r + 1) / 2
            if checkPath(mid) {
                l = mid
            } else {
                r = mid - 1
            }
        }
        return l
    }
}