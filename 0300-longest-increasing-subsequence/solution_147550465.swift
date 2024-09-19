class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var LIS = Array(repeating: 1, count: nums.count)
        for i in 1..<nums.count {
            for j in 0..<i {
                if nums[i] > nums[j] && LIS[i] < LIS[j] + 1 {
                    LIS[i] = LIS[j] + 1
                }
            }
        }
        var max = LIS[0]
        for i in 1..<LIS.count {
            if LIS[i] > max {
                max = LIS[i]
            }
        }
        return max
    }
}