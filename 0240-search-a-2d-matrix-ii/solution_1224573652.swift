class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        var x = 0, y = n - 1
        while x < m && y >= 0 {
            if matrix[x][y] == target {
                return true
            } else if matrix[x][y] > target {
                y -= 1
            } else {
                x += 1
            }
        }
        return false
    }
}