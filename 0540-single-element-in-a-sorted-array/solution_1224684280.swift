class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var l = 0, r = nums.count - 1
        while l < r {
            var mid = l + (r - l) / 2
            if mid % 2 == 1 {
                mid -= 1
            }
            if nums[mid] != nums[mid + 1] {
                r = mid
            } else {
                l = mid + 2
            }
        }
        return nums[l]
    }
}