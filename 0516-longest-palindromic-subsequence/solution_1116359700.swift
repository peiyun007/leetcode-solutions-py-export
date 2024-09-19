class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let arr = Array(s)
        var dp = Array(repeating: Array(repeating: 0, count: arr.count+1), count: arr.count+1)
        for i in (0..<arr.count).reversed() {
            for j in i..<arr.count {
                if j == i {
                    dp[i][j] = 1
                } else if j == i + 1 {
                    dp[i][j] = arr[i] == arr[j] ? 2 : 1
                } else if arr[i] == arr[j] {
                    dp[i][j] = dp[i+1][j-1] + 2
                } else {
                    dp[i][j] = max(dp[i][j-1], dp[i+1][j])
                }
            }
        }
        return dp[0][arr.count-1]
    }
}