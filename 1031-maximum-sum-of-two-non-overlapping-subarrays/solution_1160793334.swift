class Solution {
    func maxSumTwoNoOverlap(_ nums: [Int], _ firstLen: Int, _ secondLen: Int) -> Int {
        return max(solve(nums, firstLen, secondLen), solve(nums, secondLen, firstLen))
    }

    func solve(_ nums: [Int], _ x: Int, _ y: Int) -> Int {
        var dp1 = Array(repeating: 0, count: nums.count)
        var dp2 = Array(repeating: 0, count: nums.count)
        var sum = 0
        for i in 0..<nums.count {
            if i < x {
                sum += nums[i]
                dp1[i] = sum
            } else {
                sum += (nums[i] - nums[i-x])
                dp1[i] = max(dp1[i-1], sum)
            }
        }
        sum = 0
        for j in (0..<nums.count).reversed() {
            if nums.count - 1 - j < y {
                sum += nums[j]
                dp2[j] = sum
            } else {
                sum += (nums[j] - nums[j+y])
                dp2[j] = max(dp2[j+1], sum)
            }
        }
        var res = 0
        for i in x-1..<nums.count-y {
            res = max(res, dp1[i]+dp2[i+1])
        }
        return res
    }
}