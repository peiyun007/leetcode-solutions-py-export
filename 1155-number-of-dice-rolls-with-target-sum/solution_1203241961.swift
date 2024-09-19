class Solution {
    private let mod = 1_0000_0000_7

    func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: target+1), count: n+1)
        dp[0][0] = 1
        for i in 1...n {
            for j in 1...target {
                for kk in 1...k {
                    if j >= kk {
                        dp[i][j] = (dp[i][j] + dp[i-1][j-kk]) % mod
                    }
                }
            }
        }
        return dp[n][target] % mod
    }

}