class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        var l = 0, r = m * n
        while l < r {
            let mid = l + (r - l) / 2
            let i = mid / n
            let j = mid % n
            if matrix[i][j] == target {
                return true
            } else if matrix[i][j] < target {
                l = mid + 1
            } else {
                r = mid
            }
        }
        return false
    }
}