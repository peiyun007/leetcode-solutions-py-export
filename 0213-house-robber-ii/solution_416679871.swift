class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        let n = nums.count
        var dp = Array(repeating: Array(repeating: 0, count: n+1), count: 2)
        dp[0][n-1] = nums[n-1]
        dp[1][n-1] = 0
        for i in (0...n-2).reversed() {
            if i == 0 {
                dp[0][i] = dp[0][i+1]
                dp[1][i] = dp[1][i+2] + nums[i]
            } else {
                dp[0][i] = max(dp[0][i+2]+nums[i], dp[0][i+1])
                dp[1][i] = max(dp[1][i+2]+nums[i], dp[1][i+1])
            }
        }
        return max(dp[0][0], dp[1][0])
    }
}