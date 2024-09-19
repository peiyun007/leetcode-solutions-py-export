class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var set = Set<Int>()
        for i in 0..<nums.count {
            if i > k {
                set.remove(nums[i-k-1])
            }
            if set.contains(nums[i]) {
                return true
            }
            set.insert(nums[i])
        }
        return false
    }
}