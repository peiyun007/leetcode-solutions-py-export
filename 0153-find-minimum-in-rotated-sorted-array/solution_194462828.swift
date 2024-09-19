/*
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 0
        }
        if nums.count == 1 {
            return nums[0]
        }
        var low =  0
        var high = nums.count - 1
        while low <= high {
            let mid = low + (high - low) / 2
            if (mid + 1 < nums.count) && nums[mid] > nums[mid + 1] {
                return nums[mid + 1]
            }
            if (mid - 1 >= 0) && nums[mid] < nums[mid - 1] {
                return nums[mid]
            }
            if nums[mid] > nums[0] {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return nums[0]
    }
}
*/

class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var low =  0
        var high = nums.count - 1
        while low < high {
            if nums[low] < nums[high] {
                return nums[low]
            }
            let mid = low + (high - low) / 2
            if nums[mid] >= nums[low] {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return nums[low]
    }
}