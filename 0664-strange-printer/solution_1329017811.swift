class Solution {
    func strangePrinter(_ s: String) -> Int {
        let arr = Array(s)
        let n = arr.count
        var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in (0..<n).reversed() {
            dp[i][i] = 1
            for j in i+1..<n {
                if arr[i] == arr[j] {
                    dp[i][j] = dp[i][j-1]
                } else {
                    var minn = Int.max
                    for k in i..<j {
                        minn = min(minn, dp[i][k] + dp[k+1][j])
                    }
                    dp[i][j] = minn
                }
            }
        }
        return dp[0][n-1]
    }
}