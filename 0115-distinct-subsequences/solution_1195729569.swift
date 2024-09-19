class Solution {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let mod = 1_0000_0000_7
        let arr_s = Array(s)
        let arr_t = Array(t)
        
        var dp = Array(repeating: Array(repeating: 0, count: arr_s.count+1), count: arr_t.count+1)
        for j in 0...arr_s.count {
            dp[0][j] = 1
        }
        for i in 1...arr_t.count {
            for j in 1...arr_s.count {
                if arr_t[i-1] == arr_s[j-1] {
                    dp[i][j] = (dp[i-1][j-1] + dp[i][j-1]) % mod
                } else {
                    dp[i][j] = dp[i][j-1]
                }
            }
        }
        return dp[arr_t.count][arr_s.count]
    }
}