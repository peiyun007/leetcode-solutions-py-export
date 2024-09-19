class Solution {
    func largestSumOfAverages(_ nums: [Int], _ k: Int) -> Double {
        var sum = Array(repeating: 0, count: nums.count+1)
        var dp = Array(repeating: Double(0), count: nums.count+1)
        for i in 1...nums.count {
            sum[i] = nums[i-1] + sum[i-1]
            dp[i] = Double(sum[i])/Double(i)
        }
        if k == 1 {
            return Double(sum[nums.count])/Double(nums.count)
        }
        for kk in 2...k {
            var temp = Array(repeating: Double(0), count: nums.count+1)
            for i in kk...nums.count {
                for j in 1..<i {
                    temp[i] = max(temp[i], dp[j] + Double(sum[i]-sum[j])/Double(i-j))
                } 
            }
            dp = temp
        }
        return dp[nums.count]
    }
}