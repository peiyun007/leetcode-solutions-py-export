class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        if grid[0][0] != 0 {
            return -1
        }
        let m = grid.count
        let n = grid.count
        var queue = [(Int, Int)]()
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        queue.append((0, 0))
        visited[0][0] = true

        var step = 0
        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                size -= 1

                let (x, y) = queue.removeFirst()
                if x == m-1 && y == n-1 {
                    return step + 1
                }
                for dx in -1...1 {
                    for dy in -1...1 {
                        let nx = x + dx
                        let ny = y + dy
                        if nx < 0 || nx >= m || ny < 0 || ny >= n || visited[nx][ny] || grid[nx][ny] != 0 {
                            continue
                        }
                        visited[nx][ny] = true
                        queue.append((nx, ny))
                    }
                }
            }
            step += 1
        }
        return -1
    }
}