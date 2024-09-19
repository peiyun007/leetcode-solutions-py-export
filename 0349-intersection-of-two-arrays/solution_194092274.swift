class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        guard nums1.count > 0 && nums2.count > 0 else {
            return []
        }
        var set = Set<Int>()
        let arr2 = nums2.sorted(by: <)
        for num in nums1 {
            if binarySearch(arr2, num) {
                set.insert(num)
            }
        }
        return Array(set)
    }
    
    func binarySearch(_ nums: [Int], _ target: Int) -> Bool {
        var low = 0
        var high = nums.count - 1
        while low <= high {
            let middle = low + (high - low) / 2
            if nums[middle] < target {
                low = middle + 1
            } else if nums[middle] > target {
                high = middle - 1
            } else {
                return true
            }
        }
        return false
    }
}