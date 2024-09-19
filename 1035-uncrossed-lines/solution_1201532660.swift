class Solution {
    func maxUncrossedLines(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: nums2.count + 1), count: nums1.count + 1)
        for i in 1...nums1.count {
            for j in 1...nums2.count {
                if nums1[i-1] == nums2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp[nums1.count][nums2.count]
    }
}