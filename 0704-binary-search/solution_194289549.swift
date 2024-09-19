class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        guard nums.count > 0 else {
            return -1
        }
        var low = 0
        var high = nums.count - 1
        while low < high {
            let mid = low + (high - low) / 2
            if nums[mid] < target {
                low = mid + 1
            } else if nums[mid] > target {
                high = mid
            } else {
                return mid
            }
        }
        return nums[low] == target ? low : -1
    }
}