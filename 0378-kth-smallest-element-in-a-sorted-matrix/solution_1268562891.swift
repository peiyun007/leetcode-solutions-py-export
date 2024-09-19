class Solution {
    func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
        let n = matrix.count
        var low = matrix[0][0], high = matrix[n-1][n-1] + 1
        while low < high {
            let mid = low + (high-low) / 2
            var cnt = 0
            var j = n-1
            for i in 0..<n {
                while j >= 0 && matrix[i][j] > mid {
                    j -= 1
                }
                cnt += (j+1)
            }
            if cnt >= k {
                high = mid
            } else {
                low = mid + 1
            }
        }
        return low
    }
}