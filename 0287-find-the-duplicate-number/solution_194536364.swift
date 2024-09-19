class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        guard nums.count > 1 else {
            return -1
        }
        var low = 1
        var high = nums.count - 1
        while low < high {
            let mid = low + (high - low) / 2
            var count = 0
            for i in nums {
                if i <= mid {
                    count += 1
                }
            }
            if count <= mid {
                low = mid + 1
            } else if count > mid {
                high = mid
            }
        }
        return low
    }
}