class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 && matrix[0].count > 0 else {
            return false
        }
        let m = matrix.count, n = matrix[0].count
        var low = 0, high = (m - 1) * n + (n - 1)
        while low <= high {
            var middle = (low + high) / 2
            var i = middle / n, j = middle % n
            if target == matrix[i][j] {
                return true
            } else if target < matrix[i][j] {
                high = middle - 1
            } else {
                low = middle + 1
            }
        }
        return false
    }
}