class Solution {
    func wiggleMaxLength(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var up = Array(repeating: 0, count: nums.count)
        var down = Array(repeating: 0, count: nums.count)
        up[0] = 1
        down[0] = 1
        for i in 1..<nums.count {
            if nums[i] > nums[i - 1] {
                up[i] = down[i - 1] + 1
                down[i] = down[i - 1]
            } else if nums[i] < nums[i - 1] {
                down[i] = up[i - 1] + 1
                up[i] = up[i - 1]
            } else {
                up[i] = up[i - 1]
                down[i] = down[i - 1]
            }
        }
        return max(up[nums.count - 1], down[nums.count - 1])
    }
}