class Solution {
    func findNumberOfLIS(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        var dp = Array(repeating: 1, count: nums.count)
        var count = Array(repeating: 1, count: nums.count)
        var maxLength = 1
        for i in 1..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] {
                    if dp[j] + 1 > dp[i] {
                        dp[i] = dp[j] + 1
                        count[i] = count[j]
                    } else if dp[j] + 1 == dp[i] {
                        count[i] += count[j]
                    }
                }
            }
            maxLength = max(maxLength, dp[i])
        }
        var ans = 0
        for i in 0..<nums.count {
            if dp[i] == maxLength {
                ans += count[i]
            }
        }
        return ans
    }
}