class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var dp = Array(repeating:1, count: nums.count)
        var ans = 1
        for i in 0..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] && dp[j] + 1 > dp[i] {
                    dp[i] = dp[j] + 1
                    ans = max(ans, dp[i])
                }
            }
        }
        return ans
    }
}