class Solution {
    func profitableSchemes(_ G: Int, _ P: Int, _ group: [Int], _ profit: [Int]) -> Int {
        // dp[i][j][k]: 前k个任务，使用j个人，达成profit=i的作法
        let mod = 1_0000_0000_7
        let K = group.count
        var dp = Array(repeating: Array(repeating: Array(repeating: 0, count: G+1), count: P+1), count: K+1)
        dp[0][0][0] = 1
        for k in 1...K {
            let g = group[k-1]
            let p = profit[k-1]
            for i in 0...P {
                for j in 0...G {
                    var x = 0
                    if j - g >= 0 {
                        x = dp[k-1][max(0, i-p)][j-g]
                    }
                    dp[k][i][j] = (dp[k-1][i][j] + x) % mod
                }
            }
        }
        var ans = 0
        for j in 0...G {
            ans = (ans + dp[K][P][j]) % mod
        }
        return ans
    }
}