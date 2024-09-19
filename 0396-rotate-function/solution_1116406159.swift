class Solution {
    func maxRotateFunction(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return 0
        }
        var sum = 0
        var f0 = 0
        for i in 0..<nums.count {
            sum += nums[i]
            f0 += i * nums[i]
        }
        var dp = Array(repeating: 0, count: nums.count)
        dp[0] = f0
        var maxVal = f0
        for i in 1..<nums.count {
            dp[i] = dp[i-1] + sum - nums.count * nums[nums.count - i]
            maxVal = max(maxVal, dp[i])
        }
        return maxVal
    }
}