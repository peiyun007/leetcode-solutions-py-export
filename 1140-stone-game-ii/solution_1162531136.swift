class Solution {
    func stoneGameII(_ piles: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: piles.count+1), count: piles.count+1)
        var tailSum = 0
        for i in (0..<piles.count).reversed() {
            tailSum += piles[i]
            for j in 1...piles.count {
                if i+2*j >= piles.count {
                    dp[i][j] = tailSum
                } else {
                    for k in 1...2*j {
                        dp[i][j] = max(dp[i][j], tailSum - dp[i+k][max(k, j)])
                    }
                }
            }
        }
        return dp[0][1]
    }
}