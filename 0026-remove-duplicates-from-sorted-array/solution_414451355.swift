class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        var j = 0
        for i in 0..<nums.count {
            if nums[i] != nums[j] {
                nums[j + 1] = nums[i]
                j += 1
            }
        }
        return j + 1
    }
}