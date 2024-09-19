class Solution {
    func largest1BorderedSquare(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var left = Array(repeating: Array(repeating: 0, count: n), count: m)
        var up = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if j >= 1 && grid[i][j] == 1 {
                    left[i][j] = left[i][j-1] + grid[i][j]
                } else {
                    left[i][j] = grid[i][j]
                }
                if i >= 1 && grid[i][j] == 1 {
                    up[i][j] = up[i-1][j] + grid[i][j]
                } else {
                    up[i][j] = grid[i][j]
                }
            }
        }
        var ans = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    var len = min(left[i][j], up[i][j])
                    while len >= 0 {
                        if left[i-len+1][j] >= len && up[i][j-len+1] >= len {
                            break
                        }
                        len -= 1
                    }
                    ans = max(ans, len)
                }
            }
        }
        return ans * ans
    }
}