class Solution {
    private var m = 0
    private var n = 0
    private var dp = Array(repeating: Array(repeating: -1, count: 71), count: 8000)
    func find(_ mat: [[Int]], _ row: Int, _ sum: Int, _ target: Int) -> Int {
        if row >= m {
            return abs(sum-target)
        }
        if dp[sum][row] != -1 {
            return dp[sum][row]
        }
        var ans = Int.max
        for i in 0..<n {
            ans = min(ans, find(mat, row + 1, sum + mat[row][i], target))
            if ans == 0 {
                break
            }
        }
        dp[sum][row] = ans
        return ans
    }
    
    
    func minimizeTheDifference(_ mat: [[Int]], _ target: Int) -> Int {
        m = mat.count
        n = mat[0].count
        return find(mat, 0, 0, target)
    }
}