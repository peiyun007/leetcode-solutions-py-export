class Solution {
    /// 参考花花酱的
    func numTilings(_ n: Int) -> Int {
        let mod = 1_0000_0000_7
        var dp0 = Array(repeating: 0, count: n+1)
        var dp1 = dp0
        dp0[0] = 1
        dp0[1] = 1
        if n < 2 {
            return 1
        }
        for i in 2...n {
            dp0[i] = ((dp0[i-1] + dp0[i-2]) % mod + (2*dp1[i-1]) % mod) % mod
            dp1[i] = (dp0[i-2] + dp1[i-1]) % mod
        }
        return dp0[n]
    }
}