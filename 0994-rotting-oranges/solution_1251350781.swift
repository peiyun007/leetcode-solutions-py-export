class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var queue = [(Int, Int)]()
        var dis = Array(repeating: Array(repeating: -1, count: n), count: m)
        let dirs = [0, -1, 0, 1, 0]
        var cnt = 0
        
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 2 {
                    queue.append((i, j))
                    dis[i][j] = 0
                } else if grid[i][j] == 1 {
                    cnt += 1
                }
            }
        }
        var ans = 0
        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                size -= 1

                let (x, y) = queue.removeFirst()
                for i in 0..<4 {
                    let nx = x + dirs[i]
                    let ny = y + dirs[i+1]
                    if nx < 0 || nx >= m || ny < 0 || ny >= n || dis[nx][ny] != -1 || grid[nx][ny] == 0 {
                        continue
                    }
                    dis[nx][ny] = dis[x][y] + 1
                    queue.append((nx, ny))
                    if grid[nx][ny] == 1 {
                        cnt -= 1
                        ans = dis[nx][ny]
                        if cnt == 0 {
                            break
                        }
                    }
                }
            }
            
        }
        return cnt == 0 ? ans : -1
    }
}