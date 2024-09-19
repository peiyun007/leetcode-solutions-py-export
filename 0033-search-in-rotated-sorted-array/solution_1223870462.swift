class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var low = 0
        var high = nums.count
        while low < high {
            let mid = low + (high - low) / 2
            if nums[mid] == target {
                return mid
            } else if nums[0] <= nums[mid] {
                if nums[0] <= target && target < nums[mid] {
                    high = mid
                } else {
                    low = mid + 1
                }
            } else {
                if nums[mid] < target && target <= nums[nums.count-1] {
                    low = mid + 1
                } else {
                    high = mid
                }
            }
        }
        return -1
    }
}