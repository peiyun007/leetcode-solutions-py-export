class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 2
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] > nums[mid+1] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return left
    }
}