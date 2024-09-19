class Solution {
    func search(_ nums: [Int], _ target: Int) -> Bool {
        var l = 0
        var r = nums.count - 1
        while l <= r {
            let mid = l + (r - l) / 2
            if nums[mid] == target {
                return true
            }
            if nums[l] == nums[mid] && nums[mid] == nums[r] {
                l += 1
                r -= 1
            }  else if nums[l] <= nums[mid] {
                if nums[l] <= target && target < nums[mid] {
                    r = mid - 1
                } else {
                    l = mid + 1
                }
            } else {
                if nums[mid] < target && target <= nums[nums.count-1] {
                    l = mid + 1
                } else {
                    r = mid - 1
                }
            }
        }
        return false
    }
}