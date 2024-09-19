class Solution {
    func findPeakGrid(_ mat: [[Int]]) -> [Int] {
        let m = mat.count, n = mat[0].count
        var l = 0, r = m
        while l < r {
            let i = l + (r-l) / 2
            var j = -1, maxVal = -1
            for k in 0..<n {
                if mat[i][k] > maxVal {
                    j = k
                    maxVal = mat[i][k]
                }
            }
            if i-1 >= 0 && mat[i][j] < mat[i-1][j] {
                r = i
                continue
            }
            if i+1 < m && mat[i][j] < mat[i+1][j] {
                l = i + 1
                continue
            }
            return [i, j]
        }
        return [0]
    }
}