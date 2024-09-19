class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        guard nums.count >= 3 else {
            return 0
        }
        var count = 0
        var dp = Array(repeating: 0, count: nums.count)
        for i in 2..<nums.count {
            if nums[i]-nums[i-1] == nums[i-1] - nums[i-2] {
                dp[i] = dp[i-1] + 1
            }
            count += dp[i]
        }
        return count
    }
}