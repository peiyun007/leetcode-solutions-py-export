class Solution {
    func countBits(_ num: Int) -> [Int] {
        var dp = Array(repeating: 0, count: num + 1)
        for i in 0...num {
            dp[i] = dp[i / 2] + (i % 2)
        }
        return dp
    }
}