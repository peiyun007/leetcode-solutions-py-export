class Solution {
    func highestPeak(_ isWater: [[Int]]) -> [[Int]] {
        let m = isWater.count
        let n = isWater[0].count
        var queue = [(Int, Int)]()
        let dirs = [0, -1, 0, 1, 0]
        var res = Array(repeating: Array(repeating: -1, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if isWater[i][j] == 1 {
                    queue.append((i, j))
                    res[i][j] = 0
                }
            }
        }
        var index = 0
        // using removeFirst() was giving TLE so insted used indexing
        while index < m * n {
            let (x, y) = queue[index]
            for i in 0..<4 {
                let nx = x + dirs[i]
                let ny = y + dirs[i+1]
                if nx < 0 || nx >= m || ny < 0 || ny >= n || res[nx][ny] != -1 {
                    continue
                }
                res[nx][ny] = res[x][y] + 1
                queue.append((nx, ny))
            }
            index += 1
        }
        return res
    }
}