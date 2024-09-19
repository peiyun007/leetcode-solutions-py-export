class Solution {
    func findRotateSteps(_ ring: String, _ key: String) -> Int {
        let rArr = Array(ring)
        let kArr = Array(key)
        let m = rArr.count, n = kArr.count
        let kInf = Int.max / 2
        var pos = [Character: [Int]]()
        for (i, ch) in rArr.enumerated() {
            pos[ch, default: []].append(i)
        }
        var dp = Array(repeating: Array(repeating: kInf, count: m), count: n)
        for i in pos[kArr[0], default: []] {
            dp[0][i] = min(i, m-i) + 1
        }
        for i in 1..<n {
            for j in pos[kArr[i], default: []] {
                for k in pos[kArr[i-1], default: []] {
                    dp[i][j] = min(dp[i][j], dp[i-1][k] + min(abs(j-k), m-abs(j-k))+1)
                }
            }
        }
        return dp[n-1].min() ?? kInf
    }
}