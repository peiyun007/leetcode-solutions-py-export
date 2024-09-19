class Solution {
    // 参考 花花酱 LeetCode 410
    func splitArray(_ nums: [Int], _ k: Int) -> Int {
        var dp = Array(repeating: Array(repeating: Int.max / 2, count: nums.count+1), count: k+1)
        var sum = Array(repeating: 0, count: nums.count)
        sum[0] = nums[0]
        for i in 1..<nums.count {
            sum[i] = sum[i-1] + nums[i]
        }
        for i in 0..<nums.count {
            dp[1][i] = sum[i]
        }
        if k < 2 {
           return dp[k][nums.count-1]
        }
        for i in 2...k {
            for j in 0..<nums.count {
                for m in 0..<j {
                    dp[i][j] = min(dp[i][j], max(dp[i-1][m], sum[j] - sum[m]))
                }
            }
        }
        return dp[k][nums.count-1]
    }
}