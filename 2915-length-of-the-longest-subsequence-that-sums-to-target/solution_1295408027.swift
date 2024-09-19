class Solution {
    func lengthOfLongestSubsequence(_ nums: [Int], _ target: Int) -> Int {
        var dp = Array(repeating: Int.min, count: target + 1)
        dp[0] = 0
        for x in nums {
            if x > target {
                continue
            }
            for j in (x...target).reversed() {
                if dp[j-x] < 0 {
                    continue
                }
                dp[j] = max(dp[j], dp[j-x]+1)
            }
        }
        return dp[target] != Int.min ? dp[target] : -1
    }
}