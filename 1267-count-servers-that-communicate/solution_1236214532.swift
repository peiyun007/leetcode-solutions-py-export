class Solution {
    func countServers(_ grid: [[Int]]) -> Int {
        let m = grid.count
        let n = grid[0].count
        var rows = Array(repeating: 0, count: m)
        var cols = Array(repeating: 0, count: n)
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 {
                    rows[i] += 1
                    cols[j] += 1
                }
            }
        }
        var ans = 0
        for i in 0..<m {
            for j in 0..<n {
                if grid[i][j] == 1 && (rows[i] > 1 || cols[j] > 1) {
                    ans += 1
                }
            }
        }
        return ans
    }
}