class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var ans = Int.max
        var left = 0
        var sum = 0
        for right in 0..<nums.count {
            sum += nums[right]
            while sum-nums[left] >= target {
                sum -= nums[left]
                left += 1
            }
            if sum >= target {
                ans = min(ans, right-left+1)
            }
        }
        return ans == Int.max ? 0 : ans
    }
}