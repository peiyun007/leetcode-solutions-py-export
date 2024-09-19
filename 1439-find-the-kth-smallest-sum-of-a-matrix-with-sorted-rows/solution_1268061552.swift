class Solution {
    private var leftK = 0
    func kthSmallest(_ mat: [[Int]], _ k: Int) -> Int {
        let m = mat.count, n = mat[0].count
        var sl = 0, sr = 0
        for i in 0..<m {
            sl += mat[i][0]
            sr += mat[i][n-1]
        }
        var left = sl, right = sr + 1
        while left < right {
            let mid = left + (right - left) / 2
            leftK = k
            if dfs(m-1, mid-sl) {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return left

        func dfs(_ i: Int, _ s: Int) -> Bool {
            if i < 0 {
                leftK -= 1
                return leftK == 0
            }
            for x in mat[i] {
                if s-(x-mat[i][0]) < 0 {
                    break
                }
                if dfs(i-1, s-(x-mat[i][0])) {
                    return true
                }
            }
            return false
        }
    }
}