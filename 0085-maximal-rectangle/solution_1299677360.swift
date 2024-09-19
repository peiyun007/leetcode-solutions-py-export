class Solution {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        let m = matrix.count, n = matrix[0].count
        var left = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == "1" {
                    left[i][j] = j == 0 ? 1 : left[i][j-1]+1
                }
            }
        }
        var ans = 0
        for i in 0..<m {
            for j in 0..<n {
                if matrix[i][j] == "0" {
                    continue
                }
                var minWidth = Int.max
                for k in (0...i).reversed() {
                    minWidth = min(minWidth, left[k][j])
                    ans = max(ans, minWidth * (i-k+1))
                }
            }
        }
        return ans
    }
}