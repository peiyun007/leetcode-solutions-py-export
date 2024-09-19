class Solution {
    func longestArithSeqLength(_ nums: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: 1, count: 1001), count: nums.count)
        var res = -1
        for i in 1..<nums.count {
            for j in 0..<i {
                let diff = nums[i] - nums[j] + 500
                dp[i][diff] = max(dp[i][diff], dp[j][diff] + 1)
                res = max(res, dp[i][diff])
            }
        }
        return res == -1 ? 0 : res
    }
}