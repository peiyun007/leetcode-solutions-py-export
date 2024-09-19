class Solution {
    func firstMissingPositive(_ n: [Int]) -> Int {
        var nums = n
        for i in 0 ..< nums.count {
            while nums[i] > 0 && nums[i] <= nums.count && nums[nums[i] - 1] != nums[i] {
                nums.swapAt(i, nums[i] - 1)
            }
        }
        for i in 0 ..< nums.count {
            if nums[i] != i + 1 {
                return i + 1
            }
        }
        return nums.count + 1
    }
}