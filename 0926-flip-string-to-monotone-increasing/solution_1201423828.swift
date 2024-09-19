class Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        let arr = Array(s)
        var dp = Array(repeating: Array(repeating: 0, count: 2), count: arr.count + 1)
        for i in 1...arr.count {
            if arr[i-1] == "0" {
                dp[i][0] = dp[i-1][0]
                dp[i][1] = min(dp[i-1][0], dp[i-1][1]) + 1
            } else {
                dp[i][0] = dp[i-1][0] + 1
                dp[i][1] = min(dp[i-1][0], dp[i-1][1])
            }
        }
        return min(dp[arr.count][0], dp[arr.count][1])
    }
}