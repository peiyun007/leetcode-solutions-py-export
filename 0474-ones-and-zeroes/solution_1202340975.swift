class Solution {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
        for str in strs {
            let zeros = count0(str)
            let ones = str.count - zeros
            for i in (0...m).reversed() {
                for j in (0...n).reversed() {
                    if i >= zeros && j >= ones {
                        dp[i][j] = max(dp[i][j], dp[i-zeros][j-ones]+1)
                    }
                }
            }
        }
        return dp[m][n]
    }

    func count0(_ str: String) -> Int {
        var nm = 0
        for ch in str {
            if ch == "0" {
                nm += 1
            }
        }
        return nm
    }
}