class Solution {
    func checkValidGrid(_ grid: [[Int]]) -> Bool {
        if grid[0][0] != 0 {
            return false
        }
        let m = grid.count, n = grid[0].count
        var arr = Array(repeating: (0, 0), count: m*n)
        for i in 0..<m {
            for j in 0..<n {
                arr[grid[i][j]] = (i, j)
            }
        }
        for i in 0..<arr.count {
            if i + 1 == arr.count {
                continue
            }
            let x2 = arr[i+1].0
            let y2 = arr[i+1].1
            let x1 = arr[i].0
            let y1 = arr[i].1
            if abs(x2-x1) * abs(y2-y1) != 2 {
                return false
            }
        }
        return true
    }
}