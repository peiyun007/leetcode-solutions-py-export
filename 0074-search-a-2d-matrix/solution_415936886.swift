class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 && matrix[0].count > 0 else {
            return false
        }
        let m = matrix.count, n = matrix[0].count
        var low = 0, high = m * n - 1
        while low <= high {
            var mid = (low + high) / 2
            var i = mid / n, j = mid % n
            if matrix[i][j] > target {
                high = mid - 1
            } else if (matrix[i][j] < target) {
                low = mid + 1
            } else {
                return true
            }
        }
        return false
    }
}