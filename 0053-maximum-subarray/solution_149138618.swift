class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        var dp = nums
        var maxSum = nums.count > 0 ? nums[0] : 0
        for i in 1..<nums.count {
            dp[i] = max(dp[i-1] + nums[i], nums[i])
            if dp[i] > maxSum {
                maxSum = dp[i]
            }
        }
        return maxSum
    }
}