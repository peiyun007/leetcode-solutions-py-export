class Solution {
    func minInsertions(_ s: String) -> Int {
        let arr = Array(s)
        var dp = Array(repeating: Array(repeating: 0, count: arr.count), count: arr.count)
        for i in (0..<arr.count).reversed() {
            for j in i..<arr.count {
                if j-i == 0 {
                    dp[i][j] = 0
                } else if j - i == 1 {
                    dp[i][j] = arr[i] == arr[j] ? 0 : 1
                } else {
                    if arr[i] == arr[j] {
                        dp[i][j] = dp[i+1][j-1]
                    } else {
                        dp[i][j] = min(dp[i+1][j], dp[i][j-1]) + 1
                    }
                }
            }
        }
        return dp[0][arr.count-1]
    }
}