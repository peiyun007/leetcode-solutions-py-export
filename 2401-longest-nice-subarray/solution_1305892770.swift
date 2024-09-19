class Solution {
    func longestNiceSubarray(_ nums: [Int]) -> Int {
        var ans = 0
        var left = 0
        var ors = 0
        for right in 0..<nums.count {
            while ors & nums[right] > 0 {
                ors ^= nums[left]
                left += 1
            }
            ors |= nums[right]
            ans = max(ans, right-left+1)
        }
        return ans
    }
}