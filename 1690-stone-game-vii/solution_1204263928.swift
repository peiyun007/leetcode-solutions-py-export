class Solution {

    func stoneGameVII(_ stones: [Int]) -> Int {
        var sum = Array(repeating: 0, count: stones.count + 1)
        for i in 0..<stones.count {
            sum[i+1] = sum[i] + stones[i]
        }
        var dp = Array(repeating: Array(repeating: 0, count: stones.count+1), count: stones.count+1)
        for c in 2...stones.count {
            for l in 0..<stones.count {
                let r = l + c - 1
                if r >= stones.count {
                    continue
                }
                let sum = sum[r+1] - sum[l]
                dp[l][r] = max(sum-stones[l]-dp[l+1][r], sum-stones[r]-dp[l][r-1])
            }
        }
        return dp[0][stones.count-1]
    }
}