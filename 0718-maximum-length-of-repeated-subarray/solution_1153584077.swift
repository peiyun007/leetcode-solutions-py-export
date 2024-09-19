class Solution {
    func findLength(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: nums2.count + 1), count: nums1.count + 1)
        var longest = 0
        for i in 1...nums1.count {
            for j in 1...nums2.count {
                if nums1[i-1] == nums2[j-1] {
                    dp[i][j] = dp[i-1][j-1] + 1
                    if dp[i][j] > longest {
                        longest = dp[i][j]
                    }
                } else {
                    dp[i][j] = 0
                }
            }
        }
        return longest
    }
}