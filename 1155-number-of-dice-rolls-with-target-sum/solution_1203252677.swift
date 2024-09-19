class Solution {
    private let mod = 1_0000_0000_7

    func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
        var dp = Array(repeating: 0, count: target+1)
        dp[0] = 1
        for i in 1...n {
            var temp = Array(repeating: 0, count: target+1)
            for j in 1...target {
                for kk in 1...k {
                    if j >= kk {
                        temp[j] = (temp[j] + dp[j-kk]) % mod
                    }
                }
            }
            dp = temp
        }
        return dp[target] % mod
    }

}