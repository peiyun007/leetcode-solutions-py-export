class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var pre = Array(repeating: 0, count: m + 1)
        var cur = Array(repeating: 0, count: m + 1)
        for j in 1...n {
            for i in 1...m {
                let x = cur[i - 1] + grid[i-1][j-1]
                let y = pre[i] + grid[i-1][j-1]
                // cur[i] = min(x, y)
                if i == 1 || j == 1 {
                    cur[i] = max(x, y)
                } else {
                    cur[i] = min(x, y)
                }
            }
            swap(&cur, &pre)
        }
        return pre[m]
    }
}