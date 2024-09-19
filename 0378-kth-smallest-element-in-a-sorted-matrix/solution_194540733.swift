class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        var low = matrix[0][0]
        var high = matrix[matrix.count - 1][matrix[0].count - 1]
        while low <= high {
            let mid = low + (high - low) / 2
            var count = 0
            var j = matrix[0].count - 1
            for i in 0..<matrix.count {
                while j >= 0 && matrix[i][j] > mid {
                    j -= 1
                }
                count += (j + 1)
            }
            if count < k {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return low
    }
}