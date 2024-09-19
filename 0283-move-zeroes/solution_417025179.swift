class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var count = 0
        for i in 0..<nums.count {
            if nums[i] == 0 {
                count += 1
            } else {
                nums[i-count] = nums[i]
                if count > 0 {
                   nums[i] = 0 
                }   
            }
        }
    }
}