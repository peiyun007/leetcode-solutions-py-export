class Solution {
    func largestSumOfAverages(_ nums: [Int], _ k: Int) -> Double {
        var sum = Array(repeating: 0, count: nums.count+1)
        var dp = Array(repeating: Array(repeating: Double(0), count: k+1), count: nums.count+1)
        for i in 1...nums.count {
            sum[i] = nums[i-1] + sum[i-1]
        }
        if k == 1 {
            return Double(sum[nums.count])/Double(nums.count)
        }
        for i in 1...nums.count {
            dp[i][1] = Double(sum[i])/Double(i)
            for kk in 2...k where kk <= i {
                for j in 1..<i {
                    dp[i][kk] = max(dp[i][kk], dp[i][kk-1], dp[j][kk-1] + Double(sum[i]-sum[j])/Double(i-j))
                }
            }
        }
        return dp[nums.count][k]
    }
}