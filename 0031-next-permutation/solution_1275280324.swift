class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        let n = nums.count
        if n <= 1 {
            return
        }
        var i = n-2, j = n-1, k = n-1
        while i >= 0 && nums[i] >= nums[j] {
            i -= 1
            j -= 1
        }
        if i >= 0 {
            while nums[k] <= nums[i] {
                k -= 1
            }
            (nums[i], nums[k]) = (nums[k], nums[i])
        }
        i = j
        j = n-1
        while i < j {
            (nums[i], nums[j]) = (nums[j], nums[i])
            i += 1
            j -= 1
        }
    }
}