class Solution {
    func maxDistance(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        let dirs = [0, -1, 0, 1, 0]
        var queue = [(Int, Int)]()
        var dis = Array(repeating: Array(repeating: Int.max, count: n), count: m)
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    dis[i][j] = 0
                    queue.append((i, j))
                }
            }
        }

        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                size -= 1
                let (x, y) = queue.removeFirst()

                for i in 0..<4 {
                    let nx = x + dirs[i]
                    let ny = y + dirs[i+1]
                    if nx < 0 || nx >= m || ny < 0 || ny >= n {
                        continue
                    }
                    if dis[nx][ny] == Int.max {
                        dis[nx][ny] = dis[x][y] + 1
                        queue.append((nx, ny))
                    }
                }
            }
        }

        var ans = -1
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 0 {
                    ans = max(ans, dis[i][j])
                }
            }
        }
        return ans == Int.max ? -1 : ans
    }
}

