class Solution {
    func numPermsDISequence(_ s: String) -> Int {
        //dp[i][j]: how many permutations of [0...i] such that the ith is j
        let mod = 1_0000_0000_7
        let sArr = Array(s)
        let n = sArr.count
        var dp = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
        for j in 0...n {
            dp[0][j] = 1
        }
        for i in 1...n {
            for j in 0...i {
                if sArr[i-1] == "I" {
                    for k in 0..<j {
                        dp[i][j] += dp[i-1][k]
                        dp[i][j] %= mod
                    }
                } else {
                    for k in j..<i {
                        dp[i][j] += dp[i-1][k]
                        dp[i][j] %= mod
                    }
                }
            }
        }
        return dp[n].reduce(0) { ($0+$1) % mod }
    }
}