class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var count = 0
        for i in 0..<nums.count {
            if nums[i] == val {
                count += 1
            } else {
                nums[i - count] = nums[i]
            }
        }
        return nums.count - count
    }
}