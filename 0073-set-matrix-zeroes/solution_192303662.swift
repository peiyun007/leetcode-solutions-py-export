class Solution {
    func setZeroes(_ matrix: inout [[Int]]) {
        guard matrix.count > 0 else {
            return
        }
        var col0 = 1, rows = matrix.count, cols = matrix[0].count
        for i in 0..<rows {
            if matrix[i][0] == 0 {
                col0 = 0
            }
            for j in 1..<cols {
                if matrix[i][j] == 0 {
                    matrix[i][0] = 0
                    matrix[0][j] = 0
                }
            }
        }
        for i in (0..<rows).reversed() {
            for j in (1..<cols).reversed() {
                if matrix[i][0] == 0 || matrix[0][j] == 0 {
                    matrix[i][j] = 0
                }
            }
            if col0 == 0 {
                matrix[i][0] = 0
            }
        }
    }
}